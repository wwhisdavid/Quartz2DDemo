//
//  DisplayViewController.m
//  Quartz2DDemo
//
//  Created by guoran on 16/8/2.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import "DisplayViewController.h"

@implementation DisplayViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)displayDrawingWithBlock:(displayBlock)block
{
    if (block) {
        block();
    }
}

@end
