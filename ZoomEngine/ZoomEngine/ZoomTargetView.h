//
//  ZoomTarget.h
//  ZoomEngine
//
//  Created by johan ten broeke on 28/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZoomTargetView;

@protocol ZoomTargetDelegate
-(void)zoomTargetDidLoad:(ZoomTargetView *)zoomTarget;
-(void)zoomTargetWillReceiveFocus:(ZoomTargetView*)zoomTarget;
-(void)zoomTargetDidReceiveFocus:(ZoomTargetView*)zoomTarget;
-(void)zoomTargetWillLoseFocus:(ZoomTargetView*)zoomTarget;
-(void)zoomTargetDidLoseFocus:(ZoomTargetView*)zoomTarget;
@end

@interface ZoomTargetView : UIView
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic, weak) id <ZoomTargetDelegate> delegate;
@end
