//
//  Person.m
//  AudioTest
//
//  Created by peidong on 16/8/23.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import "Person.h"

@implementation Person
{
    // 实例变量
    NSString *name;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        name = @"wolf";
        self.age = 25;

    }
    return self;
}

- (void)function1 {
    NSLog(@"执行方法111111");
}

- (void)function2 {
    NSLog(@"执行方法222222");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@   age: %d",name,self.age];
}



@end
