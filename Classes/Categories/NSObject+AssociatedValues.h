//
//  NSObject+AssociatedValues.h
//  BlockCategories
//
//  Created by Christophe Knage on 01/09/2012.
//  Copyright (c) 2012 Christophe Knage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NSObjectAssociatedValues)

- (void)associateValue:(id)value withKey:(NSString *)key;
- (id)associatedValueForKey:(NSString *)key;

@end
