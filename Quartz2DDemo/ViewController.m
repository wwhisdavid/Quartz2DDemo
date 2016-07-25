//
//  ViewController.m
//  Quartz2DDemo
//
//  Created by guoran on 16/7/24.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "ViewController.h"
#import <BlocksKit/UIControl+BlocksKit.h>

#import "SimpleView.h"
#import "SimpleShapeView.h"
#import "ProgressView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SimpleView *view1 = [[SimpleView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:view1];
    
    SimpleShapeView *view2 = [[SimpleShapeView alloc] initWithFrame:CGRectMake(0, 200, 200, 200)];
    [self.view addSubview:view2];
    
    ProgressView *view3 = [[ProgressView alloc] initWithFrame:CGRectMake(200, 0, 100, 100)];
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(200, 120, 100, 30)];
    slider.minimumValue = 0;
    slider.maximumValue = 1;
    slider.value = 0;
    [slider bk_addEventHandler:^(UISlider* sender) {
        view3.progress = sender.value;
    } forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:view3];
    [self.view addSubview:slider];
    
    
}

static NSInteger buttonPositionX = 0;
static NSInteger buttonPositionY = 0;

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
