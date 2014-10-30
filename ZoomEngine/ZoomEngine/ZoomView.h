//
//  ZoomView.h
//  ZoomEngine
//
//  Created by johan ten broeke on 28/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#define SHOW_ORIENTATION_MARKER YES
#define SHOW_DEBUG_VIEWPORT YES
#define LOG_ZOOM_PROPERTIES YES

#import <UIKit/UIKit.h>

@class ZoomTargetViewController;
@class ZoomView;

@protocol ZoomViewDelegate

-(void)zoomView:(ZoomView*)zoomView willZoomToTargteNamed:(NSString*)name;
-(void)zoomView:(ZoomView*)zoomView didZoomToTargteNamed:(NSString*)name;

-(void)zoomViewWillZoomToRoot:(ZoomView*)zoomView;
-(void)zoomViewDidZoomToRoot:(ZoomView*)zoomView;

@end

@interface ZoomView : UIView

@property (nonatomic,weak) id <ZoomViewDelegate> delegate;

-(void)addZoomTargetWithName:(NSString*)name
                    andColor:(UIColor*)color
                   andXscale:(CGFloat)xScale
                   andYScale:(CGFloat)yScale
                 andRotation:(CGFloat)theta
             andXtranslation:(CGFloat)tx
             andYtranslation:(CGFloat)ty
    andContentViewController:(ZoomTargetViewController*)viewController;

-(void)zoomToTargetWithName:(NSString*)name;

@end
