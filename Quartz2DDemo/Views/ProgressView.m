//
//  ProgressView.m
//  Quartz2DDemo
//
//  Created by guoran on 16/7/25.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "ProgressView.h"
/**
 *  画个进度条
 */

@implementation ProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    // 系统重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // 创建贝瑟尔路径
    CGFloat radius = rect.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    CGFloat endA = - M_PI_2 + _progress * M_PI * 2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius - 2 startAngle:-M_PI_2 endAngle:endA clockwise:YES];
    [path addLineToPoint:center];
    [path closePath];
    [path fill];
}

@end
