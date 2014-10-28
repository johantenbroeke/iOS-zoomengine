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

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    ZoomView *v = [[ZoomView alloc] init];
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
    
    
    ZoomTarget *view = [[ZoomTarget alloc] init];
    [view setBackgroundColor:[UIColor greenColor]];
    view.frame = CGRectMake(0, 0, 400, 400);
    
    view.transform = CGAffineTransformConcat(view.transform, CGAffineTransformMakeTranslation(20, 20));
    view.transform = CGAffineTransformConcat(view.transform, CGAffineTransformMakeScale(0.5, 0.5));
    view.transform = CGAffineTransformConcat(view.transform, CGAffineTransformMakeRotation(-1));
    
    view.initialTransform = view.transform;
    view.name = @"groen";
    [v addZoomTarget:view];
    
    view = [[ZoomTarget alloc] init];
    [view setBackgroundColor:[UIColor redColor]];
    view.frame = CGRectMake(0, 0, 400, 400);
    
    view.transform = CGAffineTransformConcat(view.transform, CGAffineTransformMakeTranslation(45, 45));
    view.transform = CGAffineTransformConcat(view.transform, CGAffineTransformMakeScale(0.2, 0.2));
    view.transform = CGAffineTransformConcat(view.transform, CGAffineTransformMakeRotation(5));
    
    view.initialTransform = view.transform;
    view.name = @"rood";
    [v addZoomTarget:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
