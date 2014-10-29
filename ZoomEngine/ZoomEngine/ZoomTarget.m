//
//  ZoomTarget.m
//  ZoomEngine
//
//  Created by johan ten broeke on 28/10/14.
//  Copyright (c) 2014 Fullscreen. All rights reserved.
//

#import "ZoomTarget.h"

@implementation ZoomTarget

-(id)init{
    self = [super init];
    if(self){
        UIView *marker = [[UIView alloc] init];
        marker.backgroundColor = [UIColor whiteColor];
        marker.frame = CGRectMake(10, 10, 10, 10);
        [self addSubview:marker];
        
        [self removeConstraints:self.constraints];
        self.translatesAutoresizingMaskIntoConstraints = YES;

    }
    return self;
}


@end
