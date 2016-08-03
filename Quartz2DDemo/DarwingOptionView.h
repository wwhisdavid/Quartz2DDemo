//
//  DarwingOptionView.h
//  Quartz2DDemo
//
//  Created by guoran on 16/8/3.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DarwingOptionView;
@protocol DarwingOptionViewDelegate <NSObject>

@required

- (void)darwingOptionView:(DarwingOptionView *)darwingToolView didSelectColor:(UIColor *)color;
- (void)darwingOptionView:(DarwingOptionView *)darwingToolView didChangeSliderValue:(CGFloat)value;

@end

@interface DarwingOptionView : UIView

@property(nonatomic, weak) id<DarwingOptionViewDelegate> delegate;

@end
