//
//  BarChartView.m
//  Quartz2DDemo
//
//  Created by guoran on 16/7/26.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "BarChartView.h"

@implementation BarChartView

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
    NSArray *arr = @[@10, @20, @30, @15];
    
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    
    for (int i = 0; i < arr.count; i++) {
        
        w = rect.size.width / (2 * arr.count - 1);
        x = 2 * w * i;
        h = [arr[i] floatValue] / 100.0 * rect.size.height;
        y = rect.size.height - h;
        
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        
        
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
