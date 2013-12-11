//
//  BBAlertButton.m
//  BlockCategories
//
//  Created by Christophe Knage on 25/01/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import "BBAlertButton.h"

@implementation BBAlertButton

+ (BBAlertButton *)button
{
    return [[self alloc] init];
}

+ (BBAlertButton *)buttonWithTitle:(NSString *)title action:(dispatch_block_t)action
{
    NSParameterAssert(title);
    
    BBAlertButton *button = [[self class] button];
    button.title = title;
    button.action = action;
    
    return button;
}

@end
