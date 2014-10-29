//
//  ZoomTarget.m
//  ZoomEngine
//
//  Created by johan ten broeke on 28/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#import "ZoomTarget.h"
#import "ZoomView.h"

@implementation ZoomTarget

-(id)init{
    self = [super init];
    if(self){
        
        if(SHOW_ORIENTATION_MARKER){
            UIView *marker = [[UIView alloc] init];
            marker.backgroundColor = [UIColor whiteColor];
            marker.frame = CGRectMake(10, 10, 10, 10);
            [self addSubview:marker];
        }
        
    }
    return self;
}


@end
