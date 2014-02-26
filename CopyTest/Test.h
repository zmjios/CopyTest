//
//  Test.h
//  CopyTest
//
//  Created by 曾明剑 on 14-2-21.
//  Copyright (c) 2014年 zmj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject<NSCopying,NSMutableCopying>

@property (nonatomic, retain) NSString *name;
@property (nonatomic, copy)   NSString *stuClass;
@property (nonatomic, assign) NSInteger score;

@end
