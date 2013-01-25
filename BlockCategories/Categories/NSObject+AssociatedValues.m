//
//  NSObject+AssociatedValues.m
//  BlockCategories
//
//  Created by Christophe Knage on 01/09/2012.
//  Copyright (c) 2012 Christophe Knage. All rights reserved.
//

#import "NSObject+AssociatedValues.h"
#import <objc/runtime.h>

@implementation NSObject (NSObjectAssociatedValues)

- (void)associateValue:(id)value withKey:(NSString *)aKey
{
    // Fake an ivar on self by adding an associative reference
    objc_setAssociatedObject(self, (__bridge void *)aKey, value, OBJC_ASSOCIATION_RETAIN);
}

- (id)associatedValueForKey:(NSString *)aKey
{
    // Retrive the faked ivar on self by retriving the associated reference
    return objc_getAssociatedObject(self, (__bridge void *)aKey);
}

@end
