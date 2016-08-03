//
//  DarwingView.m
//  Quartz2DDemo
//
//  Created by guoran on 16/8/3.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "DarwingView.h"
#import "DarwingPath.h"

@interface DarwingView(){
    UIBezierPath *_path;
}

@property (nonatomic, strong) NSMutableArray *pathsArr;

@end

@implementation DarwingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _lineColor = [UIColor blackColor];
        _lineWidth = 5.f;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (NSMutableArray *)pathsArr
{
    if (!_pathsArr) {
        _pathsArr = [[NSMutableArray alloc] init];
    }
    return _pathsArr;
}

- (CGPoint)pointWithTouches:(NSSet<UITouch *> *)touches{
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint startPoint = [self pointWithTouches:touches];
    DarwingPath *path = [DarwingPath bezierPathWithColor:_lineColor
                                               lineWidth:_lineWidth
                                              startPoint:startPoint];
    _path = path;
    [_pathsArr addObject:path];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 获取移动点
    CGPoint moveP = [self pointWithTouches:touches];
    
    // 想给上面的路径添加直线，是不是要拿到上面的路径啊.
    // 添加线段
    [_path addLineToPoint:moveP];
    
    // 画线(调用drawRect)
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    for (DarwingPath *path in self.pathsArr) {
        if ([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)path;
            [image drawInRect:rect];
        }else{
            [path.pathColor set];
            [path stroke];
        }
    }
}

- (void)clearDarwing{
    [self.pathsArr removeAllObjects];
    [self setNeedsDisplay];
}

- (void)undoDarwing
{
    [self.pathsArr removeLastObject];
    [self setNeedsDisplay];
}

- (void)eraseDarwing
{
    self.lineColor = [UIColor whiteColor];
}

@end
