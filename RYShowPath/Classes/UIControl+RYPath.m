//
//  UIControl+RYPath.m
//  RYShowPath
//
//  Created by 小毅 on 2019/6/26.
//

#import "UIControl+RYPath.h"
#import <objc/runtime.h>
#import "RYPathMacro.h"

@implementation UIControl (RYPath)

+(void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UIControl class];
        Method m1 = class_getInstanceMethod(cls, @selector(sendAction:to:forEvent:));
        Method m2 = class_getInstanceMethod(cls, @selector(sendAction_RYPath:to:forEvent:));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (void)sendAction_RYPath:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [self sendAction_RYPath:action to:target forEvent:event];
    printf("RY_UIControl_Path:%s,Action:%s\n",NSStringFromClass([target class]).UTF8String,[NSStringFromSelector(action) UTF8String]);
}

@end
