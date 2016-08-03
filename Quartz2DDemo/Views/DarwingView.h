//
//  DarwingView.h
//  Quartz2DDemo
//
//  Created by guoran on 16/8/3.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DarwingView : UIView

@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineWidth;

- (void)clearDarwing;
- (void)undoDarwing;
- (void)eraseDarwing;

@end
