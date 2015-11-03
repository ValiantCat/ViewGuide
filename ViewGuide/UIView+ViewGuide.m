//
//  UIView+ViewGuide.m
//  
//
//  Created by nero on 15/10/16.
//  Copyright © 2015年 nero. All rights reserved.
//

#import "UIView+ViewGuide.h"
#import <objc/runtime.h>
#import "VGViewGuide.h"
static inline void swizzleSelector(Class clazz,SEL originalSelector , SEL swizzledSelector) {
    
    Class class = clazz ;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);


    BOOL didAddMethodInit =     class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethodInit) {
        class_addMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}




@implementation UIView (ViewGuide)
- (void)setViewGuide:(VGViewGuide *)viewGuide {
    objc_setAssociatedObject(self, @selector(viewGuide), viewGuide, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (VGViewGuide *)viewGuide {
    return objc_getAssociatedObject(self, @selector(viewGuide));
}

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
#ifndef ViewGuideMarco
        swizzleSelector(self, @selector(init), @selector(init_vg));
        swizzleSelector(self, @selector(awakeFromNib), @selector(awakeFromNib_vg));
        swizzleSelector(self, @selector(initWithFrame:), @selector(initWithFrame_vg:));
        swizzleSelector(self, @selector(setFrame:), @selector(setFrame_vg:));
        swizzleSelector(self, @selector(didMoveToSuperview), @selector(didMoveToSuperview_vg));
        swizzleSelector(self, @selector(drawRect:), @selector(drawRect_vg:)); 
#endif
    });
}

-(id)init_vg{
    
    self = [self init_vg];
    
    return self;
}

-(void)awakeFromNib_vg{
    if ([self isKindOfClass:[VGViewGuide class]])  return;
    [self commonInitialization];
}

-(id)initWithFrame_vg:(CGRect)frame{
    self = [self initWithFrame_vg:frame];
    if ([self isKindOfClass:[VGViewGuide class]])  return self;
    [self commonInitialization];
    return self;
}


-(void)commonInitialization{
    self.layer.borderColor = [UIColor orangeColor].CGColor;
    self.layer.borderWidth = 1.0;
    self.viewGuide = [[VGViewGuide alloc] initWithFrame_vg:self.bounds];
    [self addSubview:self.viewGuide];
}

-(void)setFrame_vg:(CGRect)frame{
    [self setFrame_vg:frame];
    if ([self isKindOfClass:[VGViewGuide class]])  return;
    self.viewGuide.frame = self.bounds;
    [self.viewGuide setNeedsDisplay];
}


-(void)didMoveToSuperview_vg {
    [self didMoveToSuperview_vg];
    if ([self isKindOfClass:[VGViewGuide class]])  return;
    self.viewGuide.frame = self.bounds;
    [self.viewGuide setNeedsDisplay];
}

- (void)drawRect_vg:(CGRect)frame {
    [self drawRect_vg:frame];
    if ([self isKindOfClass:[VGViewGuide class]])  return;
    self.viewGuide.frame = self.bounds;
    [self.viewGuide setNeedsDisplay];
    
}
- (void)updateDebug {
    if ([self isKindOfClass:[VGViewGuide class]])  return;
    self.viewGuide.frame = self.bounds;
    [self.viewGuide  setNeedsDisplay];
}


@end
@implementation UIViewController (ViewGuide)
+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
#ifndef ViewGuideMarco
        swizzleSelector(self, @selector(viewDidLayoutSubviews), @selector(viewDidLayoutSubviews_vg));
#endif
    });
}
- (void)viewDidLayoutSubviews_vg {
    [self updateDebugFrameAtView:self.view];
}
- (void)updateDebugFrameAtView:(UIView *)view {
    for (UIView *v in view.subviews) {
        [v updateDebug];
        if (v.subviews.count) {
            [self updateDebugFrameAtView:v];
        }
    }
}

@end
