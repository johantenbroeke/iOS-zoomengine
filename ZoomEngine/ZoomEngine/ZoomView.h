//
//  ZoomView.h
//  ZoomEngine
//
//  Created by johan ten broeke on 28/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZoomView : UIView

-(void)addZoomTarget:(UIView*)view;
+(CGAffineTransform)makeTransformWithXscale:(CGFloat)xScale
                                  andYScale:(CGFloat)yScale
                                andRotation:(CGFloat)theta
                            andXtranslation:(CGFloat)tx
                            andYtranslation:(CGFloat)ty;


//helpers
- (CGFloat) xscale;
- (CGFloat) yscale;
- (CGFloat) rotation;
- (CGFloat) tx;
- (CGFloat) ty;

-(void)logProps;

@end
