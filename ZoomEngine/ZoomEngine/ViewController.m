//
//  ViewController.m
//  ZoomEngine
//
//  Created by johan ten broeke on 28/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#import "ViewController.h"
#import "ZoomView.h"
#import "ZoomTargetView.h"
#import "ZoomTargetViewController.h"

@interface ViewController ()

@property (nonatomic,strong) ZoomView *zoomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    ZoomView *v = [[ZoomView alloc] init];
    self.ZoomView = v;
    self.zoomView.delegate = self;
    v.frame = CGRectMake(0, 0, 400, 400);
    v.center = self.view.center;
    [self.view addSubview:v];
    
    ZoomTargetViewController *vc = [[ZoomTargetViewController alloc] init];

    [v addZoomTargetWithName:@"green"
                   andColor:[UIColor greenColor]
                  andXscale:0.6
                  andYScale:0.6
                andRotation:-0.5
            andXtranslation:200
            andYtranslation:200
     andContentViewController:vc];
    
    ZoomTargetViewController *vc2 = [[ZoomTargetViewController alloc] init];
    
    [v addZoomTargetWithName:@"red"
                   andColor:[UIColor redColor]
                  andXscale:0.2
                  andYScale:0.2
                andRotation:3
            andXtranslation:45
            andYtranslation:45
     andContentViewController:vc2];
    
    ZoomTargetViewController *vc3 = [[ZoomTargetViewController alloc] init];
    
    [v addZoomTargetWithName:@"black"
                   andColor:[UIColor blackColor]
                  andXscale:0.1
                  andYScale:0.1
                andRotation:3
            andXtranslation:50
            andYtranslation:50
     andContentViewController:vc3];
    
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, 100, 25)];
    button1.backgroundColor = [UIColor redColor];
    [button1 setTitle:@"red" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(toRed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(150, 30, 100, 25)];
    button2.backgroundColor = [UIColor lightGrayColor];
    [button2 setTitle:@"remove" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(remove:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
}

-(void)zoomView:(ZoomView *)zoomView didZoomToTargteNamed:(NSString *)name{
    NSLog(@"did zoom to %@",name);
}

-(void)zoomView:(ZoomView *)zoomView willZoomToTargteNamed:(NSString *)name{
    NSLog(@"will zoom to %@",name);
}

-(void)zoomViewWillZoomToRoot:(ZoomView *)zoomView{
    NSLog(@"will zoom to root");
}

-(void)zoomViewDidZoomToRoot:(ZoomView *)zoomView{
    NSLog(@"did zoom to root");
}

-(void)toRed:(UIButton*)button{
    [self.zoomView zoomToTargetWithName:@"red"];
}

-(void)remove:(UIButton*)button{
    [self.zoomView removeFromSuperview];
    self.zoomView = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
