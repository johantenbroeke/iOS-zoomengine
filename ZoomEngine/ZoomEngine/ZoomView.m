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

@end

@implementation ZoomView


//helpers
-(CGAffineTransform)makeTransformWithXscale:(CGFloat)xScale
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

-(void)logZoomProperties
{
    NSLog(@"\n\nZoomView props:\n-------\nxscale : %f \nyscale : %f \nrotation : %f \ntransX : %f \ntransY : %f",
          [self xscale],
          [self yscale],
          [self rotation],
          [self tx],
          [self ty]);
}

-(id)init
{
    self = [super init];
    if(self){
        
        [self setBackgroundColor:[UIColor lightGrayColor]];
        self.targets = [[NSMutableArray alloc] init];
        
        if(SHOW_ORIENTATION_MARKER){
            UIView *marker = [[UIView alloc] init];
            marker.backgroundColor = [UIColor whiteColor];
            marker.frame = CGRectMake(10, 10, 10, 10);
            [self addSubview:marker];
        }
        
        UITapGestureRecognizer *r = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomOut:)];
        [self addGestureRecognizer:r];
        
        self.zoomedOutTransform = self.transform;
        
        if(SHOW_DEBUG_VIEWPORT){
            [self showDebugViewport];
        }
        
    }
    return self;
}

-(void)showDebugViewport
{
    UIView *viewPort = [[UIView alloc] init];
    viewPort.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    viewPort.center = self.center;
    [viewPort.layer setBorderWidth:3.0];
    [viewPort.layer setBorderColor:[[UIColor colorWithRed:0.10 green:0.45 blue:0.73 alpha:1.0] CGColor]];
    [viewPort.layer setCornerRadius:2.0];
    [viewPort setUserInteractionEnabled:NO];
    [self.superview addSubview:viewPort];
}

-(void)zoomOut:(UITapGestureRecognizer*)r
{
    [self zoomToTransform:self.zoomedOutTransform];
}

-(void)addZoomTargetWithName:(NSString*)name
                andColor:(UIColor*)color
               andXscale:(CGFloat)xScale
               andYScale:(CGFloat)yScale
             andRotation:(CGFloat)theta
         andXtranslation:(CGFloat)tx
         andYtranslation:(CGFloat)ty
{
    
    ZoomTarget *view = [[ZoomTarget alloc] init];
    [view setBackgroundColor:color];
    view.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    CGAffineTransform trans = [self makeTransformWithXscale:xScale
                                                      andYScale:yScale
                                                    andRotation:theta
                                                andXtranslation:tx
                                                andYtranslation:ty];
    
    view.transform = trans;
    view.name = name;
    [self addZoomTarget:view];
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
    CGAffineTransform transform = CGAffineTransformInvert(t.transform);
    [self zoomToTransform:transform];
}

-(void)zoomToTransform:(CGAffineTransform)transform
{
    [CATransaction begin];
    CABasicAnimation *zoomAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    zoomAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    zoomAnim.duration = 0.5;
    zoomAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(self.transform)];
    zoomAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform)];
    [CATransaction setCompletionBlock:^{
        if(LOG_ZOOM_PROPERTIES){
            [self logZoomProperties];
        }
    }];
    [self.layer addAnimation:zoomAnim forKey:nil];
    [CATransaction commit];
    self.transform = transform;
}

@end
