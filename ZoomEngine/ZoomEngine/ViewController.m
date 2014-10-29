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

    [v addZoomTargetWithName:@"green"
                   andColor:[UIColor greenColor]
                  andXscale:0.6
                  andYScale:0.6
                andRotation:-0.5
            andXtranslation:200
            andYtranslation:200];
    
    [v addZoomTargetWithName:@"red"
                   andColor:[UIColor redColor]
                  andXscale:0.2
                  andYScale:0.2
                andRotation:3
            andXtranslation:45
            andYtranslation:45];
    
    
    [v addZoomTargetWithName:@"black"
                   andColor:[UIColor blackColor]
                  andXscale:0.1
                  andYScale:0.1
                andRotation:3
            andXtranslation:50
            andYtranslation:50];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
