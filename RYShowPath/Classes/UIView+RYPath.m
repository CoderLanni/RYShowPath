//
//  UIView+RYPath.m
//  RYShowPath
//
//  Created by 小毅 on 2019/6/26.
//

#import "UIView+RYPath.h"
#import <objc/runtime.h>
#import "RYPathMacro.h"

@implementation UIView (RYPath)


+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UIView class];
        Method m1 = class_getInstanceMethod(cls, @selector(hitTest:withEvent:));
        Method m2 = class_getInstanceMethod(cls, @selector(hitTest:withEvent_RYPath:));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (UIView *)hitTest:(CGPoint)point withEvent_RYPath:(UIEvent *)event {
    printf("RY_HitTest_Path:%s\n",self.description.UTF8String);
    return [self hitTest:point withEvent_RYPath:event];
}


@end
