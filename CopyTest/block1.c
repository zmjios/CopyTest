//
//  block1.c
//  CopyTest
//
//  Created by 曾明剑 on 14-2-23.
//  Copyright (c) 2014年 zmj. All rights reserved.
//

#include <stdio.h>

int main()
{
    ^{ printf("Hello, World!\n"); } ();
    return 0;
}
