//
//  ZoomTargetViewController.h
//  ZoomEngine
//
//  Created by johan ten broeke on 30/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZoomTargetView.h"

@interface ZoomTargetViewController : UIViewController <ZoomTargetDelegate>

@property (nonatomic,strong) ZoomTargetView *zoomTargetView;

@end
