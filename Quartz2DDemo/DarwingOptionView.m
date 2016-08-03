//
//  DarwingOptionView.m
//  Quartz2DDemo
//
//  Created by guoran on 16/8/3.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "DarwingOptionView.h"
#import "Masonry.h"
#import <BlocksKit/UIControl+BlocksKit.h>

#define TAG_Start 1000;
@implementation DarwingOptionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor grayColor];
        [self setupViews];
    }
    return self;
}

- (void)setupViews{
    UISlider *slide = [[UISlider alloc] init];
    slide.minimumValue = 5;
    slide.maximumValue = 20;
    
    [slide bk_addEventHandler:^(UISlider *sender) {
        if ([self.delegate respondsToSelector:@selector(darwingOptionView:didChangeSliderValue:)]) {
            [self.delegate darwingOptionView:self didChangeSliderValue:sender.value];
        }
    } forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:slide];
    [slide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@60);
    }];
    
    
    NSArray *colorArr = @[@"红色", @"黄色", @"蓝色", @"黑色"];
    NSInteger count = colorArr.count;
    CGFloat btnW = ([UIScreen mainScreen].bounds.size.width - (count - 1) * 20.f) / count;
    CGFloat btnH = 60.f;
    UIButton *colorBtn;
    for (int i = 0 ; i <count; i ++) {
        colorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        colorBtn.frame = CGRectMake(i * (btnW + 20.f), 100.f, btnW, btnH);
        colorBtn.tag = i + TAG_Start;
        [colorBtn setTitle:[colorArr objectAtIndex:i] forState:UIControlStateNormal];
        [colorBtn setBackgroundColor:!i ? [UIColor redColor] : (i == 1 ? [UIColor yellowColor] : i == 2 ? [UIColor blueColor] : [UIColor blackColor])];
        colorBtn.titleLabel.textColor = [UIColor whiteColor];
        [colorBtn bk_addEventHandler:^(UIButton *sender) {
            if ([self.delegate respondsToSelector:@selector(darwingOptionView:didSelectColor:)]) {
                [self.delegate darwingOptionView:self didSelectColor:sender.backgroundColor];
            }
        } forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:colorBtn];
    }
}
@end
