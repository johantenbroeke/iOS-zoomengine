//
//  ZoomTargetViewController.m
//  ZoomEngine
//
//  Created by johan ten broeke on 30/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#import "ZoomTargetViewController.h"

@interface ZoomTargetViewController ()

@end

@implementation ZoomTargetViewController

-(void)loadView {
    self.view = [[UIView alloc] init];
    [self.view setFrame:CGRectMake(20, 20, 360, 360)];
    [self.view setAlpha:0.6];
    self.view.backgroundColor = [UIColor yellowColor];
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)zoomTargetDidLoad:(ZoomTarget *)zoomTarget
{
    NSLog(@"DID LOAD zoomtarget %@",zoomTarget.name);
}

-(void)zoomTargetDidReceiveFocus:(ZoomTarget *)zoomTarget
{
    NSLog(@"DID ZOOM to %@",zoomTarget.name);
}

-(void)zoomTargetWillReceiveFocus:(ZoomTarget *)zoomTarget
{
    NSLog(@"WILL ZOOM to %@",zoomTarget.name);
}

-(void)zoomTargetWillLoseFocus:(ZoomTarget*)zoomTarget
{
    NSLog(@"WILL LOSE ZOOM for %@",zoomTarget.name);
}

-(void)zoomTargetDidLoseFocus:(ZoomTarget*)zoomTarget
{
    NSLog(@"DID LOSE ZOOM for %@",zoomTarget.name);
}


@end
