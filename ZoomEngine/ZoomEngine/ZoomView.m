//
//  ZoomView.m
//  ZoomEngine
//
//  Created by johan ten broeke on 28/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#import "ZoomView.h"
#import "ZoomTarget.h"

@interface ZoomView ()

@property (nonatomic,strong) NSMutableArray *targets;
@property (nonatomic,assign) CGAffineTransform zoomedOutTransform;
@property (nonatomic,assign) CGFloat zoomedOutHeight;

@property (nonatomic,assign) BOOL zoomOutBeforeZoomingIn;

@end

@implementation ZoomView

+(CGAffineTransform)makeTransformWithXscale:(CGFloat)xScale
                              andYScale:(CGFloat)yScale
                            andRotation:(CGFloat)theta
                        andXtranslation:(CGFloat)tx
                        andYtranslation:(CGFloat)ty

{
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    transform.a = xScale * cos(theta);
    transform.b = yScale * sin(theta);
    transform.c = xScale * -sin(theta);
    transform.d = yScale * cos(theta);
    transform.tx = tx;
    transform.ty = ty;
    
    return transform;
}


//helpers
- (CGFloat) xscale
{
    CGAffineTransform t = self.transform;
    return sqrt(t.a * t.a + t.c * t.c);
}

- (CGFloat) yscale
{
    CGAffineTransform t = self.transform;
    return sqrt(t.b * t.b + t.d * t.d);
}

- (CGFloat) rotation
{
    CGAffineTransform t = self.transform;
    return atan2f(t.b, t.a);
}

- (CGFloat) tx
{
    CGAffineTransform t = self.transform;
    return t.tx;
}

- (CGFloat) ty
{
    CGAffineTransform t = self.transform;
    return t.ty;
}

-(void)logProps
{
    NSLog(@"\n\nprops\n-------\nxscale : %f \nyscale : %f \nrotation : %f \ntransX : %f \ntransY : %f",[self xscale],[self yscale],[self rotation],[self tx],[self ty]);
}

-(id)init
{
    self = [super init];
    if(self){
        [self setBackgroundColor:[UIColor lightGrayColor]];
        self.targets = [[NSMutableArray alloc] init];
        
        UIView *marker = [[UIView alloc] init];
        marker.backgroundColor = [UIColor whiteColor];
        marker.frame = CGRectMake(10, 10, 10, 10);
        [self addSubview:marker];
        
        UITapGestureRecognizer *r = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomOut:)];
        [self addGestureRecognizer:r];
        
        self.zoomedOutTransform = self.transform;
        
        [self removeConstraints:self.constraints];
        self.translatesAutoresizingMaskIntoConstraints = YES;
        self.zoomOutBeforeZoomingIn = NO;
        
    }
    return self;
}


-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.zoomedOutHeight = frame.size.height;
}

-(void)zoomOut:(UITapGestureRecognizer*)r
{
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         self.transform = self.zoomedOutTransform;
                     }
                     completion:^(BOOL finished){

                     }];
    
}


-(void)addZoomTarget:(ZoomTarget*)view
{
    [self.targets addObject:view];
    [self addSubview:view];
    
    UITapGestureRecognizer *r = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [view addGestureRecognizer:r];
    
}

-(void)tapped:(UITapGestureRecognizer*)r
{
    ZoomTarget *t = (ZoomTarget*)r.view;
    
    if(self.zoomOutBeforeZoomingIn){
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^(void) {
                             self.transform = self.zoomedOutTransform;
                         }
                         completion:^(BOOL finished){
                             CGAffineTransform transform = CGAffineTransformInvert(t.transform);
                             [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^(void) {
                                                  self.transform = transform;
                                              }
                                              completion:^(BOOL finished){
                                                  //self.transform = CGAffineTransformIdentity;
                                              }];
                         }];
        
        return;
    }
    
    

    CGAffineTransform transform = CGAffineTransformInvert(t.transform);
    [UIView animateWithDuration:3.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         
//                         CALayer *presLayer = (CALayer *)self.layer.presentationLayer;
//                         self.layer.position = [presLayer position];
//                         [self.layer removeAllAnimations];
                         self.transform = transform;
                     }
                     completion:^(BOOL finished){


                         
                         [self logProps];
                     }];

}

@end
