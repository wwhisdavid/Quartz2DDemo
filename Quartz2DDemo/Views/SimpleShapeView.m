//
//  SimpleShapeView.m
//  Quartz2DDemo
//
//  Created by guoran on 16/7/25.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "SimpleShapeView.h"
/**
 *  基于UIBezierPath
 */
@implementation SimpleShapeView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawRoundedRect];
    [self drawSector];
}

/**
 *  圆角矩形
 */
- (void)drawRoundedRect{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 10, 100, 100) cornerRadius:30];
    [path stroke];
}
/**
 *  扇形
 */
- (void)drawSector{
    // 圆心
    CGPoint center = CGPointMake(20, 20);
    // 半径与角度(yes:顺时针；no：逆时针；)
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    // 闭合一半
    [path addLineToPoint:center];
    // 闭合
    [path closePath];
    // 填充
    [path fill];
}




@end
