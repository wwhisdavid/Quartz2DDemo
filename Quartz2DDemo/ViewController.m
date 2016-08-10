//
//  ViewController.m
//  Quartz2DDemo
//
//  Created by guoran on 16/7/24.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "ViewController.h"
#import <BlocksKit/UIControl+BlocksKit.h>

#import "DisplayViewController.h"
#import "ScreenshotViewController.h"
#import "DarwingBoardViewController.h"

#import "SimpleView.h"
#import "SimpleShapeView.h"
#import "ProgressView.h"
#import "PieChartView.h"
#import "BarChartView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DisplayViewController *vc = [DisplayViewController new];
    __weak __typeof(self)weakSelf = self;
    
    [self addButtonWithText:@"简单视图" hanlder:^{
         __strong __typeof(weakSelf)strongSelf = weakSelf;
        for (UIView *view in vc.view.subviews) {
            [view removeFromSuperview];
        }
        SimpleView *view1 = [[SimpleView alloc] initWithFrame:CGRectMake(0, 64, 300, 300)];
        [vc.view addSubview:view1];
        
        [strongSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    [self addButtonWithText:@"简单图形视图" hanlder:^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        for (UIView *view in vc.view.subviews) {
            [view removeFromSuperview];
        }
        SimpleShapeView *view2 = [[SimpleShapeView alloc] initWithFrame:CGRectMake(0, 64, 300, 300)];
        [vc.view addSubview:view2];
        
        [strongSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    [self addButtonWithText:@"进度圈视图" hanlder:^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        for (UIView *view in vc.view.subviews) {
            [view removeFromSuperview];
        }
        ProgressView *view3 = [[ProgressView alloc] initWithFrame:CGRectMake(200, 64, 100, 100)];
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(200, 200, 100, 30)];
        slider.minimumValue = 0;
        slider.maximumValue = 1;
        slider.value = 0;
        [slider bk_addEventHandler:^(UISlider* sender) {
            view3.progress = sender.value;
        } forControlEvents:UIControlEventValueChanged];
    
        [vc.view addSubview:view3];
        [vc.view addSubview:slider];
        
        [strongSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    [self addButtonWithText:@"饼、柱视图" hanlder:^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        for (UIView *view in vc.view.subviews) {
            [view removeFromSuperview];
        }
        
        PieChartView *view4 = [[PieChartView alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
        [vc.view addSubview:view4];
    
        BarChartView *view5 = [[BarChartView alloc] initWithFrame:CGRectMake(0, 400, 200, 200)];
        [vc.view addSubview:view5];
        
        [strongSelf.navigationController pushViewController:vc animated:YES];
    }];
  
    [self addButtonWithText:@"位图上下文" hanlder:^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        for (UIView *view in vc.view.subviews) {
            [view removeFromSuperview];
        }
        
        __block UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
        imageView.backgroundColor = [UIColor greenColor];
        [vc displayDrawingWithBlock:^{
            // 1.取个图片(图尺寸：736*618)
            UIImage *image = [UIImage imageNamed:@"mogu"];
            
            // 2.
            // 开启一个位图上下文，注意位图上下文跟view无关联，所以不需要在drawRect.
            // size:位图上下文的尺寸（新图片的尺寸）
            // opaque: 不透明度 YES：不透明 NO:透明，通常我们一般都弄透明的上下文
            // scale:通常不需要缩放上下文，取值为0，表示不缩放
            UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
            
            // 3.画背景
            [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
            
            // 4.文字
            NSString *string = @"mogujie.com";
            [string drawAtPoint:CGPointMake(20, 20) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blackColor]}];
            
            // 5.生成一张图片给我们,从上下文中获取图片
            imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            
            // 6.关闭上下文
            UIGraphicsEndImageContext();
        }];
        [vc.view addSubview:imageView];
        [strongSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    [self addButtonWithText:@"位图上下文裁剪" hanlder:^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        for (UIView *view in vc.view.subviews) {
            [view removeFromSuperview];
        }
        ScreenshotViewController *svc = [ScreenshotViewController new];
        [strongSelf.navigationController pushViewController:svc animated:YES];
    }];
    
    [self addButtonWithText:@"涂鸦板" hanlder:^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        for (UIView *view in vc.view.subviews) {
            [view removeFromSuperview];
        }
        DarwingBoardViewController *dbvc = [DarwingBoardViewController new];
        [strongSelf.navigationController pushViewController:dbvc animated:YES];
    }];
}

static NSInteger buttonPositionX = 0;
static NSInteger buttonPositionY = 64;

- (void)addButtonWithText:(NSString *)text hanlder:(void (^)())handler
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:text forState:UIControlStateNormal];
    [button sizeToFit];
    CGRect frame = button.frame;
    frame.origin = CGPointMake(([[UIScreen mainScreen] bounds].size.width - frame.size.width) / 2, buttonPositionY);
    button.frame = frame;
    buttonPositionY += 35;
    
    [button bk_addEventHandler:^(id sender) {
        if (handler) {
            handler();
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

@end
