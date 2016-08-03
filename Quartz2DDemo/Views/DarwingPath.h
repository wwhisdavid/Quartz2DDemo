//
//  DarwingPath.h
//  Quartz2DDemo
//
//  Created by guoran on 16/8/3.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DarwingPath : UIBezierPath

// 路径颜色
@property (nonatomic, strong) UIColor *pathColor;

// 起点
@property (nonatomic, assign) CGPoint  startPoint;

/**
 *  构造方法
 *
 *  @param pathColor 颜色
 *
 *  @return 路径
 */
+ (instancetype)bezierPathWithColor:(UIColor *)pathColor;

/**
 *  构造方法2
 *
 *  @param pathColor  颜色
 *  @param lineWidth  线宽
 *  @param startPoint 起点
 *
 *  @return 路径
 */
+ (instancetype)bezierPathWithColor:(UIColor *)pathColor lineWidth:(CGFloat)lineWidth startPoint:(CGPoint)startPoint;

@end
