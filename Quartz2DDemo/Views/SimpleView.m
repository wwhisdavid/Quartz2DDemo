//
//  SimpleView.m
//  Quartz2DDemo
//
//  Created by guoran on 16/7/25.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "SimpleView.h"
/**
 * 画画线
 */
@implementation SimpleView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawSimleLine];
    [self drawSimleLine2];
    [self drawSimleLine3];
    [self drawBrokenLine];
    [self drawBrokenLine2];
    [self drawCurve];
}

/**
 *  最简单的绘制：画一条线
 */
- (void)drawSimleLine{
    // 1.获取上下文（画作的封装）
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2.描述绘制线条
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 3.设置起点 --> 终点 --> 渲染
    
    // 起点（30，30）
    CGPathMoveToPoint(path, NULL, 10, 50);
    
    // 添加一根线到某个终点（100，100）
    CGPathAddLineToPoint(path, NULL, 100, 100);
    
    // 4.把路径添加到上下文
    CGContextAddPath(ctx, path);
    
    // 5.渲染上下文
    CGContextStrokePath(ctx);
    
    // 6.内存释放
    CGPathRelease(path);
}

/**
 *  简洁的绘制：画一条线
 */
- (void)drawSimleLine2{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.描述路径
    // 设置起点、线、终点
    CGContextMoveToPoint(ctx, 20, 50);
    
    CGContextAddLineToPoint(ctx, 100, 100);
    
    // 3.渲染上下文
    CGContextStrokePath(ctx);
}


/**
 *  UIKit封装（贝瑟尔路径）后绘制：画一条线
 */
- (void)drawSimleLine3
{
    // 1.创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2.设置起点
    [path moveToPoint:CGPointMake(30, 50)];
    
    // 添加一根线到某个点
    [path addLineToPoint:CGPointMake(100, 100)];
    
    // 绘制路径
    [path stroke];
}


/**
 *  简洁的绘制：画一条有样式的折线
 */
- (void)drawBrokenLine{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.描述路径
    //起点
    CGContextMoveToPoint(ctx, 40, 50);
    
    CGContextAddLineToPoint(ctx, 100, 50);
    
    // 设置起点
    CGContextMoveToPoint(ctx, 100, 50);
    
    // 默认下一根线的起点就是上一根线终点
    CGContextAddLineToPoint(ctx, 100, 200);
    
    // 3.设置绘图状态
    // 颜色
    [[UIColor redColor] setStroke];
    
    // 线宽
    CGContextSetLineWidth(ctx, 5);
    
    // 设置连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    
    // 设置顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    
    // 4.渲染上下文
    CGContextStrokePath(ctx);
}

/**
 *  UIKit封装（贝瑟尔路径）后绘制：画两条有样式的线
 */
- (void)drawBrokenLine2{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(60, 50)];
    
    [path addLineToPoint:CGPointMake(200, 200)];
    
    
    path.lineWidth = 10;
    [[UIColor redColor] set];
    
    [path stroke];
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    [path1 moveToPoint:CGPointMake(0, 0)];
    
    [path1 addLineToPoint:CGPointMake(30, 60)];
    [[UIColor greenColor] set];
    
    path1.lineWidth = 3;
    
    [path1 stroke];
}

/**
 *  利用控制点画曲线
 */
- (void)drawCurve{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.描述路径
    // 设置起点
    CGContextMoveToPoint(ctx, 70, 50);
    
    // cpx,cpy:控制点的x
    CGContextAddQuadCurveToPoint(ctx, 150, 20, 250, 50);
    
    // 3.渲染上下文
    CGContextStrokePath(ctx);
}

@end
