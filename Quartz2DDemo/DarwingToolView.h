//
//  DarwingToolView.h
//  Quartz2DDemo
//
//  Created by guoran on 16/8/2.
//  Copyright © 2016年 guoran. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DarwingToolView;
@protocol DarwingToolViewDelegate <NSObject>

@required

- (void)darwingToolView:(DarwingToolView *)darwingToolView didClickClearButton:(UIButton *)button;
- (void)darwingToolView:(DarwingToolView *)darwingToolView didClickUndoButton:(UIButton *)button;
- (void)darwingToolView:(DarwingToolView *)darwingToolView didClickEraserButton:(UIButton *)button;
- (void)darwingToolView:(DarwingToolView *)darwingToolView didClickSaveButton:(UIButton *)button;

@end

@interface DarwingToolView : UIView

@property(nonatomic, weak) id<DarwingToolViewDelegate> delegate;

@end
