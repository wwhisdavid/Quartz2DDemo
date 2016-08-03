//
//  DisplayViewController.h
//  Quartz2DDemo
//
//  Created by guoran on 16/8/2.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^displayBlock)();
@interface DisplayViewController : UIViewController

@property (nonatomic, copy) displayBlock block;

- (void)displayDrawingWithBlock:(displayBlock)block;

@end
