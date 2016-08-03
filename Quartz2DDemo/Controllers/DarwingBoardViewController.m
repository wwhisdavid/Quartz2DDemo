//
//  DarwingBoardViewController.m
//  Quartz2DDemo
//
//  Created by guoran on 16/8/2.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "DarwingBoardViewController.h"
#import "DarwingToolView.h"
#import "DarwingOptionView.h"
#import "DarwingView.h"

#import "Masonry.h"

@interface DarwingBoardViewController()<DarwingToolViewDelegate, DarwingOptionViewDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) DarwingView *darwView;

@end

@implementation DarwingBoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews{
    DarwingToolView *toolView = [[DarwingToolView alloc] init];
    [self.view addSubview:toolView];
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(64);
        make.height.mas_equalTo(@50);
    }];
    toolView.delegate = self;
    
    DarwingOptionView *optionView = [DarwingOptionView new];
    [self.view addSubview:optionView];
    [optionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(200);
    }];
    optionView.delegate = self;
    
    DarwingView *darwView = [[DarwingView alloc] init];
    [self.view addSubview:darwView];
    [darwView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(toolView.mas_bottom);
        make.bottom.equalTo(optionView.mas_top);
    }];
    self.darwView = darwView;
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (!error) {
        NSLog(@"success");
    }
}

#pragma mark - <DarwingToolViewDelegate> 

- (void)darwingToolView:(DarwingToolView *)darwingToolView didClickClearButton:(UIButton *)button
{
    [self.darwView clearDarwing];
}

- (void)darwingToolView:(DarwingToolView *)darwingToolView didClickUndoButton:(UIButton *)button
{
    [self.darwView undoDarwing];
}

- (void)darwingToolView:(DarwingToolView *)darwingToolView didClickEraserButton:(UIButton *)button
{
    [self.darwView eraseDarwing];
}

- (void)darwingToolView:(DarwingToolView *)darwingToolView didClickSaveButton:(UIButton *)button
{
    // 截屏
//    UIView *snapView = [self.darwView snapshotViewAfterScreenUpdates:YES];
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(_darwView.frame.size, NO, 0.0);
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 渲染上下文
    [_darwView.layer renderInContext:ctx];
    // 从上下文拿到图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    // 保存
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

#pragma mark - DarwingOptionViewDelegate

- (void)darwingOptionView:(DarwingOptionView *)darwingToolView didSelectColor:(UIColor *)color
{
    self.darwView.lineColor = color;
}

- (void)darwingOptionView:(DarwingOptionView *)darwingToolView didChangeSliderValue:(CGFloat)value
{
    self.darwView.lineWidth = value;
}
@end
