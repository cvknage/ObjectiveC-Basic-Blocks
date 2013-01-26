//
//  NSObject+AssociatedValues.h
//  BlockCategories
//
//  Created by Christophe Knage on 01/09/2012.
//  Copyright (c) 2012 Christophe Knage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NSObjectAssociatedValues)

/**
 * Associate a value with a key in the Objective-C runtime.
 */
- (void)associateValue:(id)value withKey:(NSString *)key;

/**
 * Retrive a value associated with a key in the Objective-C runtime.
 */
- (id)associatedValueForKey:(NSString *)key;

@end
