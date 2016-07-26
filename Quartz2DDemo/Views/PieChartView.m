//
//  PieChartView.m
//  Quartz2DDemo
//
//  Created by guoran on 16/7/26.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "PieChartView.h"

@implementation PieChartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    NSArray *arr = [NSArray arrayWithObjects:@10, @20, @70, nil];
    CGFloat radius = rect.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    
    
    __block CGFloat startA = 0;
    __block CGFloat angle = 0;
    __block CGFloat endA = 0;
    
    
    for (int i = 0; i < arr.count; i++) {
        startA = endA;
        angle = [arr[i] integerValue] / 100.0 * M_PI * 2;
        endA = startA + angle;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        
        [path addLineToPoint:center];
        [[self colorRandom] set];
        
        [path fill];
    }
}

- (UIColor *)colorRandom
{
    // 0 ~ 255 / 255
    // OC:0 ~ 1
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
