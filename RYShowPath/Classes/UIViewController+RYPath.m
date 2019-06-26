//
//  UIViewController+RYPath.m
//  RYShowPath
//
//  Created by 小毅 on 2019/6/26.
//

#import "UIViewController+RYPath.h"
#import <objc/runtime.h>
#import "RYPathMacro.h"

@implementation UIViewController (RYPath)


+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UIViewController class];
        Method m1 = class_getInstanceMethod(cls, @selector(viewDidLoad));
        Method m2 = class_getInstanceMethod(cls, @selector(ViewDidLoad_RYPath));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (void)ViewDidLoad_RYPath
{
    [self ViewDidLoad_RYPath];
    printf("RY_VC_Path:%s\n",NSStringFromClass(self.class).UTF8String);
}


@end
