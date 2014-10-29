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

@interface ZoomView : UIView

-(void)addZoomTargetWithName:(NSString*)name
                    andColor:(UIColor*)color
                   andXscale:(CGFloat)xScale
                   andYScale:(CGFloat)yScale
                 andRotation:(CGFloat)theta
             andXtranslation:(CGFloat)tx
             andYtranslation:(CGFloat)ty;

@end
