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
    [self.view setFrame:CGRectMake(0, 0, 400, 400)];
    self.view.backgroundColor = [UIColor yellowColor];
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
