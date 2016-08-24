//
//  Person+PersonCategory.m
//  AudioTest
//
//  Created by peidong on 16/8/23.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import "Person+PersonCategory.h"
#import <objc/runtime.h>

static void *strKey = &strKey;
const char * str = "key";

@implementation Person (PersonCategory)

- (void)setStr:(NSString *)str {
    
    objc_setAssociatedObject(self, &strKey, str, OBJC_ASSOCIATION_COPY);
}

- (NSString *)str {
    return objc_getAssociatedObject(self, &strKey);
}


@end
