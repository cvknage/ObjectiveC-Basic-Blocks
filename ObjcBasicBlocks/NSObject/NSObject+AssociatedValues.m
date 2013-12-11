//
//  NSObject+AssociatedValues.m
//  ObjcBasicBlocks
//
//  Created by Christophe Knage on 01/09/2012.
//  Copyright (c) 2012 Christophe Knage. All rights reserved.
//

#import "NSObject+AssociatedValues.h"
#import <objc/runtime.h>

@implementation NSObject (NSObjectAssociatedValues)

- (void)associateValue:(id)value withKey:(NSString *)key
{
    // Fake an ivar on self by adding an associative reference
    objc_setAssociatedObject(self, (__bridge void *)key, value, OBJC_ASSOCIATION_RETAIN);
}

- (id)associatedValueForKey:(NSString *)key
{
    // Retrive the faked ivar on self by retriving the associated reference
    return objc_getAssociatedObject(self, (__bridge void *)key);
}

@end
