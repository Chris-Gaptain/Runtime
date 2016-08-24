//
//  ViewController.m
//  AudioTest
//
//  Created by peidong on 16/8/16.
//  Copyright (c) 2016年 wolf. All rights reserved.
//
#define DOCU_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject]


#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import "Person+PersonCategory.h"


@interface ViewController ()

@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.person = [[Person alloc]init];
}

// 获取所有变量
- (IBAction)getAllVariate:(id)sender {
    unsigned int count = 0;

    Ivar *allVaribles = class_copyIvarList([Person class], &count);
    for (int i=0; i<count; i++) {
        Ivar ivar = allVaribles[i];
        const char * variableName = ivar_getName(ivar);
        const char * varibaleType = ivar_getTypeEncoding(ivar);
        NSLog(@"name: %s   type: %s",variableName,varibaleType);
    }
}

// 获取所有方法
- (IBAction)getAllMethod:(id)sender {
    unsigned int count = 0;
    Method *allMethod = class_copyMethodList([Person class], &count);
    for (int i=0; i<count; i++) {
        Method md = allMethod[i];
        SEL sel = method_getName(md);
        const char *methodname = sel_getName(sel);
        NSLog(@"method %s",methodname);
    }
}

// 改变私有变量name的值
- (IBAction)changeNameValue:(id)sender {
    NSLog(@"改变前: %@",self.person);
    
    unsigned int count = 0;
    Ivar *allList = class_copyIvarList([Person class], &count);
    Ivar ivv = allList[0];
    object_setIvar(self.person, ivv, @"vip");
    
    NSLog(@"改变后: %@",self.person);
}

// 添加一个新属性
- (IBAction)addAttribute:(id)sender {
    self.person.str = @"123";
    NSLog(@"---%@",self.person.str);
}

// 交换2个方法功能之后
- (IBAction)exchangFunction:(id)sender {
    Method method1 = class_getInstanceMethod([Person class], @selector(function1));
    Method method2 = class_getInstanceMethod([Person class], @selector(function2));
    // 交换方法
    method_exchangeImplementations(method1, method2);
    [self.person function1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
