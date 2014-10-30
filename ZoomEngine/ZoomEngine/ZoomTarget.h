//
//  ZoomTarget.h
//  ZoomEngine
//
//  Created by johan ten broeke on 28/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZoomTarget;

@protocol ZoomTargetDelegate
-(void)zoomTargetDidLoad:(ZoomTarget *)zoomTarget;
-(void)zoomTargetWillReceiveFocus:(ZoomTarget*)zoomTarget;
-(void)zoomTargetDidReceiveFocus:(ZoomTarget*)zoomTarget;
-(void)zoomTargetWillLoseFocus:(ZoomTarget*)zoomTarget;
-(void)zoomTargetDidLoseFocus:(ZoomTarget*)zoomTarget;
@end

@interface ZoomTarget : UIView
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic, weak) id <ZoomTargetDelegate> delegate;
@end
