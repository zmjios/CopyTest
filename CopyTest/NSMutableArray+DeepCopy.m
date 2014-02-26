//
//  NSMutableArray+DeepCopy.m
//  CopyTest
//
//  Created by 曾明剑 on 14-2-23.
//  Copyright (c) 2014年 zmj. All rights reserved.
//

#import "NSMutableArray+DeepCopy.h"

@implementation NSMutableArray (DeepCopy)

- (NSMutableArray *)mutableDeepCopy
{
    NSMutableArray *ret = [[NSMutableArray alloc] initWithCapacity:[self count]];
    for (id value in self)
    {
        id oneCopy = nil;
        if ([value respondsToSelector:@selector(mutableDeepCopy)])
        {
            oneCopy = [value mutableDeepCopy];
        }
        else if ([value respondsToSelector:@selector(mutableCopy)])
        {
            oneCopy = [value mutableCopy];
        }
        
        if (oneCopy == nil)
        {
            //非对象类
            oneCopy = [value copy];
        }
        [ret addObject: oneCopy];
    }
    return ret;
}


@end
