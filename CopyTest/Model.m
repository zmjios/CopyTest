//
//  Model.m
//  CopyTest
//
//  Created by 曾明剑 on 14-2-21.
//  Copyright (c) 2014年 zmj. All rights reserved.
//

#import "Model.h"

@implementation Model

- (id)copyWithZone:(NSZone *)zone
{
    Model *copy = [[[self class] allocWithZone:zone] init];
    
    return copy;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    Model *copy = [[[self class] allocWithZone:zone] init];
    
    return copy;
}

@end
