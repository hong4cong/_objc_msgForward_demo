//
//  Monkey.m
//  _objc_msgForward_demo
//
//  Created by luguobin on 15/9/21.
//  Copyright © 2015年 XS. All rights reserved.
//

#import "Monkey.h"
#import "ForwardingTarget.h"
#import <objc/runtime.h>

@interface Monkey()
@property (nonatomic, strong) ForwardingTarget *target;
@end

@implementation Monkey

- (instancetype)init
{
    self = [super init];
    if (self) {
        _target = [ForwardingTarget new];
        [self performSelector:@selector(sel:) withObject:@"yeyu"];
    }
    
    return self;
}


id dynamicMethodIMP(id self, SEL _cmd, NSString *str)
{
    NSLog(@"%s:动态添加的方法",__FUNCTION__);
    NSLog(@"%@", str);
    return @"1";
}


+ (BOOL)resolveInstanceMethod:(SEL)sel __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0) {
    
    class_addMethod(self.class, sel, (IMP)dynamicMethodIMP, "@@:");
    BOOL result = [super resolveInstanceMethod:sel];
    result = YES;
    return result; // 1
}

- (id)forwardingTargetForSelector:(SEL)aSelector __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0) {
    id result = [super forwardingTargetForSelector:aSelector];
    result = self.target;
    return result; // 2
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    id result = [super methodSignatureForSelector:aSelector];
    NSMethodSignature *sig = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    result = sig;
    return result; // 3
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    //    [super forwardInvocation:anInvocation];
    anInvocation.selector = @selector(invocationTest);
    [self.target forwardInvocation:anInvocation];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    [super doesNotRecognizeSelector:aSelector];
}

@end
