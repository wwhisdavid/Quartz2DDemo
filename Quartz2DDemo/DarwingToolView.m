//
//  DarwingToolView.m
//  Quartz2DDemo
//
//  Created by guoran on 16/8/2.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "DarwingToolView.h"
#import <BlocksKit/UIControl+BlocksKit.h>

#define TAG_Start 1000
typedef NS_ENUM(NSInteger, ToolBtnType){
    ToolBtnTypeClear = 0,
    ToolBtnTypeUndo,
    ToolBtnTypeErase,
    ToolBtnTypeNone,
    ToolBtnTypeSave
};

@interface DarwingToolView()

@end

@implementation DarwingToolView

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
    CGFloat btnW = [UIScreen mainScreen].bounds.size.width / 5.f;
    CGFloat btnH = 50;
    NSArray<NSString *> *titles = @[@"清除", @"撤销", @"橡皮", @"暂无", @"保存"];
    UIButton *btn;
    for (int i = 0; i < 5; i ++) {
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
        btn.tag = TAG_Start + i;
        [btn setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
        btn.titleLabel.textColor = [UIColor whiteColor];
        [btn bk_addEventHandler:^(UIButton * sender) {
            [self handlerWithType:sender.tag - 1000 andButton:sender];
        } forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

- (void)handlerWithType:(ToolBtnType)type andButton:(UIButton *)button{
    switch (type) {
        case ToolBtnTypeClear:
            if ([self.delegate respondsToSelector:@selector(darwingToolView:didClickClearButton:)]) {
                [self.delegate darwingToolView:self didClickClearButton:button];
            }
            break;
            
        case ToolBtnTypeUndo:
            if ([self.delegate respondsToSelector:@selector(darwingToolView:didClickUndoButton:)]) {
                [self.delegate darwingToolView:self didClickUndoButton:button];
            }
            break;
        
        case ToolBtnTypeErase:
            if ([self.delegate respondsToSelector:@selector(darwingToolView:didClickEraserButton:)]) {
                [self.delegate darwingToolView:self didClickEraserButton:button];
            }
            break;
        
        case ToolBtnTypeSave:
            if ([self.delegate respondsToSelector:@selector(darwingToolView:didClickSaveButton:)]) {
                [self.delegate darwingToolView:self didClickSaveButton:button];
            }
            break;
        default:
            break;
    }
}

@end
