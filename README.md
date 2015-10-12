# _objc_msgForward_demo用来测试消息转发机制


# 对象查找selector时，先查找cachelist，如果没有则查找methodlist，如果还没有就查找父类的methodlist

# 都没有是还有三次机会可以处理这次selector访问
# 1. + (BOOL)resolveInstanceMethod:(SEL)sel; 在此方法中添加相应selector以及IMP即可
# 2. - (id)forwardingTargetForSelector:(SEL)aSelector 在此方法中可以指定处理的对象，在该对象中实现selector即可
# 3. - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector; - (void)forwardInvocation:(NSInvocation *)anInvocation; 在第一个方法中reture signal，这样runtime就会产生一个NSInvocation给第二个方法，anInvocation中有target和selector，可以修改，然后让target进行调用，不调用也可以，只是什么都不发生

# 如果以上三次机会都不把握，则会调用- (void)doesNotRecognizeSelector:(SEL)aSelector; 默认的实现是抛出异常
