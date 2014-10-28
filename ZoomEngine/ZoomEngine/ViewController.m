//
//  ViewController.m
//  ZoomEngine
//
//  Created by johan ten broeke on 28/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#import "ViewController.h"
#import "ZoomView.h"
#import "ZoomTarget.h"

@interface ViewController ()



@end

@implementation ViewController{

    ZoomView *v;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    v = [[ZoomView alloc] init];
    v.frame = CGRectMake(0, 0, 400, 400);
    v.center = self.view.center;
    [self.view addSubview:v];
    
    UIView *viewPort = [[UIView alloc] init];
    viewPort.frame = CGRectMake(0, 0, 400, 400);
    viewPort.center = self.view.center;

    [viewPort.layer setBorderWidth:3.0];
    [viewPort.layer setBorderColor:[[UIColor colorWithRed:0.10 green:0.45 blue:0.73 alpha:1.0] CGColor]];
    [viewPort.layer setCornerRadius:2.0];
    [viewPort.layer setShadowOffset:CGSizeMake(-2, -2)];
    [viewPort.layer setShadowColor:[[UIColor lightGrayColor] CGColor]];
    [viewPort.layer setShadowOpacity:0.5];
    [viewPort setUserInteractionEnabled:NO];
    
    [self.view addSubview:viewPort];
    
    [self addTargetWithName:@"groen"
                   andColor:[UIColor greenColor]
                  andXscale:0.5
                  andYScale:0.5
                andRotation:-1
            andXtranslation:20
            andYtranslation:20];
    
    [self addTargetWithName:@"rood"
                   andColor:[UIColor redColor]
                  andXscale:0.2
                  andYScale:0.2
                andRotation:3
            andXtranslation:45
            andYtranslation:45];
    
    
    [self addTargetWithName:@"black"
                   andColor:[UIColor blackColor]
                  andXscale:0.1
                  andYScale:0.1
                andRotation:3
            andXtranslation:50
            andYtranslation:50];
    
}

-(void)addTargetWithName:(NSString*)name
                andColor:(UIColor*)color
               andXscale:(CGFloat)xScale
               andYScale:(CGFloat)yScale
             andRotation:(CGFloat)theta
         andXtranslation:(CGFloat)tx
         andYtranslation:(CGFloat)ty
{
    
    ZoomTarget *view = [[ZoomTarget alloc] init];
    [view setBackgroundColor:color];
    view.frame = CGRectMake(0, 0, 400, 400);
    
    CGAffineTransform trans = [ZoomView makeTransformWithXscale:xScale
                                                      andYScale:yScale
                                                    andRotation:theta
                                                andXtranslation:tx
                                                andYtranslation:ty];
    
    view.initialTransform = view.transform = trans;
    view.name = name;
    [v addZoomTarget:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
