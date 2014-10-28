//
//  ZoomTarget.h
//  ZoomEngine
//
//  Created by johan ten broeke on 28/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZoomTarget : UIView

@property (nonatomic, assign) CGAffineTransform initialTransform;
@property (nonatomic, strong) NSString *name;

@end
