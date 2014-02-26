//
//  Test.m
//  CopyTest
//
//  Created by 曾明剑 on 14-2-21.
//  Copyright (c) 2014年 zmj. All rights reserved.
//

#import "Test.h"

@implementation Test
- (id)copyWithZone:(NSZone *)zone
{
    Test *copy = [[[self class] allocWithZone:zone] init];
    
    if (copy)
    {
        copy->_name = [self.name mutableCopy];
        copy->_stuClass = [self.stuClass mutableCopy];
        copy.score = self.score;
    }
    
    return copy;
}


- (id)mutableCopyWithZone:(NSZone *)zone
{
    Test *copy = [[[self class] allocWithZone:zone] init];
    
    if (copy) {
        copy->_name = [self.name mutableCopy];
        copy->_stuClass = [self.stuClass mutableCopy];
        copy.score = self.score;
    }
    
    return copy;
}



@end
