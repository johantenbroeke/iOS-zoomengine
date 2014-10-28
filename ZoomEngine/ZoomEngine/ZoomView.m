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

@end

@implementation ZoomView

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
    
    if([t.name isEqualToString:@"groen"]){
        
        CGAffineTransform transform = CGAffineTransformMakeTranslation(100, 100);
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^(void) {
                             self.transform = transform;
                         }
                         completion:^(BOOL finished){
                             self.transform = transform;
                         }];
        
    }else{
    
        CGAffineTransform transform = CGAffineTransformInvert(t.transform);
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^(void) {
                             self.transform = transform;
                         }
                         completion:^(BOOL finished){
                             self.transform = transform;
                         }];
    }
}

@end
