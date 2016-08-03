//
//  ScreenshotViewController.m
//  Quartz2DDemo
//
//  Created by guoran on 16/8/2.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "ScreenshotViewController.h"

@interface ScreenshotViewController()

// 起始点
@property (nonatomic, assign) CGPoint startP;
// 截取板(weak 保证每次被移除会重新懒加载)
@property (nonatomic, weak) UIView *clipView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ScreenshotViewController

- (UIView *)clipView
{
    if (!_clipView) {
        UIView *v = [[UIView alloc] init];
        v.backgroundColor = [UIColor blackColor];
        v.alpha = 0.3;
        [self.view addSubview:v];
        
        _clipView = v;
    }
    
    return _clipView;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"mogu"];
    UIPanGestureRecognizer *panShot = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panShot:)];
    [self.view addGestureRecognizer:panShot];
}

- (void)panShot:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateBegan) {
        
        _startP = [pan locationInView:self.view];
        
    }else if(pan.state == UIGestureRecognizerStateChanged){
        
        CGPoint endP = [pan locationInView:self.view];
        
        CGFloat w = endP.x - _startP.x;
        CGFloat h = endP.y - _startP.y;
        
        self.clipView.frame = CGRectMake(_startP.x, _startP.y, w, h);

    }else if(pan.state == UIGestureRecognizerStateEnded){
        
        // 1.开启位图上下文
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
        
        // 2.根据手势截取矩形
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.clipView.frame];
        [path addClip];
        
        // 3.获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        // 4.渲染图层到当前上下文
        [_imageView.layer renderInContext:ctx];
        
        // 5.从上下文中得到位图
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        // 6.关闭上下文
        UIGraphicsEndImageContext();
        
        _imageView.image = image;
        
        // 7.截取板移除
        [self.clipView removeFromSuperview];
    }
}

@end
