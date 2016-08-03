//
//  DarwingPath.m
//  Quartz2DDemo
//
//  Created by guoran on 16/8/3.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "DarwingPath.h"

@implementation DarwingPath

+ (instancetype)bezierPathWithColor:(UIColor *)pathColor
{
    DarwingPath *path = [[DarwingPath alloc] init];
    path.pathColor = pathColor;
    
    return path;
}

+ (instancetype)bezierPathWithColor:(UIColor *)pathColor lineWidth:(CGFloat)lineWidth startPoint:(CGPoint)startPoint
{
    DarwingPath *path = [[DarwingPath alloc] init];
    path.pathColor = pathColor;
    path.lineWidth = lineWidth;
    path.startPoint = startPoint;
    
    [path moveToPoint:startPoint];
    
    return path;    
}
@end
