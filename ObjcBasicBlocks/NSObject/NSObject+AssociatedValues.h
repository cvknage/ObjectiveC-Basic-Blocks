//
//  NSObject+AssociatedValues.h
//  ObjcBasicBlocks
//
//  Created by Christophe Knage on 01/09/2012.
//  Copyright (c) 2012 Christophe Knage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NSObjectAssociatedValues)

/**
 * Associate a value with a key in the Objective-C runtime.
 *
 * @param value    The value to be associated with the object in the Objective-C runtime.
 * @param key      The key to associate the value with.
 */
- (void)associateValue:(id)value withKey:(NSString *)key;

/**
 * Retrive a value associated with a key in the Objective-C runtime.
 *
 * @param key  The key to retrive the associated value from the Objective-C runtime.
 * @return The value associated with the key.
 */
- (id)associatedValueForKey:(NSString *)key;

@end
