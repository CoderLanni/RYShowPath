//
//  NSObject+RYGesturePath.m
//  RYShowPath
//
//  Created by 小毅 on 2019/6/26.
//

#import "NSObject+RYGesturePath.h"
#import <objc/runtime.h>
#import "RYPathMacro.h"

@implementation NSObject (RYGesturePath)


+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //Note:it's a private class! Don't submit to the App Store!
        //for more information:https://github.com/nst/iOS-Runtime-Headers/blob/master/Frameworks/UIKit.framework/UIGestureRecognizerTarget.h
        Class cls = NSClassFromString(@"UIGestureRecognizerTarget");
        Method m1 = class_getInstanceMethod(cls, NSSelectorFromString(@"_sendActionWithGestureRecognizer:"));
        Method m2 = class_getInstanceMethod([self class], NSSelectorFromString(@"sendActionWithGestureRecognizer_RYGesture:"));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (void)sendActionWithGestureRecognizer_RYGesture:(id)arg1
{
    [self sendActionWithGestureRecognizer_RYGesture:arg1];
    printf("RY_Gesture_Path:%s\n",self.description.UTF8String);
}

@end

