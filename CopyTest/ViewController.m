//
//  ViewController.m
//  CopyTest
//
//  Created by 曾明剑 on 14-2-21.
//  Copyright (c) 2014年 zmj. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import "Model.h"
#import "NSMutableArray+DeepCopy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    Test *test1 = [[Test alloc] init];
    test1.name = @"zmj";
    test1.stuClass = @"A";
    test1.score = 100;
    NSLog(@"test1 = %@,",test1);
    
    Test *test2 = [test1 copy];
    NSLog(@"test2 = %@",test2);
    
    Test *test3 = [test1 mutableCopy];
    NSLog(@"test3 = %@",test3);
    
    
    NSString *a = [NSString stringWithFormat:@"%@",@"this is a"];//不可变
    
    NSLog(@"==============[a retainCount] = %d",[a retainCount]);
    
    NSString *b = [a copy];
    NSLog(@"==============[a retainCount] = %d,[b retainCount] = %d",[a retainCount] ,[b retainCount]);
    
    NSString *bb = [a retain];
    NSLog(@"==============[a retainCount] = %d,[bb retainCount] = %d",[a retainCount],[bb retainCount]);

    
    NSString *cc = [a mutableCopy];//实际上cc应该是NSMutableString类型
    NSLog(@"==============[cc retainCount] = %d",[cc retainCount]);
    
    NSLog(@"%d,%d,%d,%d",[a retainCount],[b retainCount],[bb retainCount],[cc retainCount]);
    
    
    
    NSMutableString *d = [NSMutableString stringWithFormat:@"%@",@"this is a"];
    
    NSLog(@"==============[d retainCount] = %d",[d retainCount]);
    
    NSString *e = [d copy];//不可变的e
    
    NSLog(@"==============[d retainCount] = %d,[e retainCount] = %d",[d retainCount] ,[e retainCount]);
    
    NSString *ff = [d retain];//实际类型是NSMutableString的ff
    
     NSLog(@"==============[d retainCount] = %d,[ff retainCount] = %d",[d retainCount],[ff retainCount]);
    
    NSString *gg = [d mutableCopy];//同上
    
    NSLog(@"==============[gg retainCount] = %d",[gg retainCount]);
    
    NSLog(@"%d,%d,%d,%d",[d retainCount],[e retainCount],[ff retainCount],[gg retainCount]);
    
    
    
    Model * model = [[Model alloc] init];
    NSLog(@"model rc=%d",[model retainCount]);
    NSArray * oriArray = [NSArray arrayWithObjects:model,@"a",@"b",nil];//源数据,不可修改
    NSLog(@"model rc=%d,oriArray rc=%d",[model retainCount],[oriArray retainCount]);
    NSArray * oriArrayCopy = [oriArray copy];//跟oriArray地址一样，浅拷贝，不可修改
    NSLog(@"model rc=%d,oriArray rc=%d,oriArrayCopy rc=%d",[model retainCount],[oriArray retainCount],[oriArrayCopy retainCount]);
    NSArray * oriArrayMCopy = [oriArray mutableCopy];//深拷贝,生成了NSMutableArray，可以修改
    NSLog(@"model rc=%d,oriArray rc=%d,oriArrayCopy rc=%d,oriArrayMCopy rc=%d",[model retainCount],[oriArray retainCount],[oriArrayCopy retainCount],[oriArrayMCopy retainCount]);
    
    NSLog(@"oriArray =%p ,0 =%p",oriArray,[oriArray objectAtIndex:0]);
    NSLog(@"oriArrayCopy =%p ,0 =%p ",oriArrayCopy,[oriArrayCopy objectAtIndex:0]);
    NSLog(@"oriArrayMCopy =%p ,0 =%p ",oriArrayMCopy,[oriArrayMCopy objectAtIndex:0]);
    NSLog(@"++++++");
    
    Model *copyModel = [model copy];//不可变
    
    NSLog(@"model rc=%d,copyModel rc=%d",[model retainCount],[copyModel retainCount]);
    
    
    
    Model * model2 = [[Model alloc] init];
    NSLog(@"model2 rc=%d",[model2 retainCount]);
    NSMutableArray *oriMArray = [NSMutableArray arrayWithObjects:model2,@"a", @"b",nil];//源数据,可以修改
    NSLog(@"model2 rc=%d,oriMArray rc=%d",[model2 retainCount],[oriMArray retainCount]);
    NSMutableArray *oriMArrayCopy = [oriMArray copy];//深拷贝，生成不可变的NSArray
    NSLog(@"model2 rc=%d,oriMArray rc=%d,oriMArrayCopy rc=%d",[model2 retainCount],[oriMArray retainCount],[oriMArrayCopy retainCount]);
    NSMutableArray *oriMArrayMCopy = [oriMArray mutableCopy];//深拷贝，可以修改
    NSLog(@"model2 rc=%d,oriMArray rc=%d,oriMArrayCopy rc=%d,oriMArrayMCopy rc=%d",[model2 retainCount],[oriMArray retainCount],[oriMArrayCopy retainCount],[oriMArrayMCopy retainCount]);
    //  NSMutableArray *oriMArrayMCopy2 = [[NSMutableArray alloc] initWithArray:oriMArray copyItems:YES];
    
    NSMutableArray *oriDeepCopyMArray = [oriMArray mutableDeepCopy];
    
    NSLog(@"oriMArray =%p, 0 =%p",oriMArray,[oriMArray objectAtIndex:0]);
    NSLog(@"oriMArrayCopy =%p, 0 =%p ",oriMArrayCopy,[oriMArrayCopy objectAtIndex:0]);
    NSLog(@"oriMArrayMCopy =%p, 0 =%p ",oriMArrayMCopy,[oriMArrayMCopy objectAtIndex:0]);
    NSLog(@"oriDeepCopyMArray = %p, 0 =%p",oriDeepCopyMArray,[oriDeepCopyMArray objectAtIndex:0]);
    //NSLog(@"oriMArrayMCopy2 0 =%p c=%d",[oriMArrayMCopy2 objectAtIndex:0],[[oriMArrayMCopy2 objectAtIndex:0] retainCount]);
    
   
    
   
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(id) initWithDictionary:(NSMutableDictionary*) jsonObject
{
    if((self = [super init]))
    {
        [self init];
        [self setValuesForKeysWithDictionary:jsonObject];
    }
    return self;
}

@end
