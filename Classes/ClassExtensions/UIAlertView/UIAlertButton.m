//
//  UIAlertButton.m
//  BlockCategories
//
//  Created by Christophe Knage on 25/01/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import "UIAlertButton.h"

@implementation UIAlertButton

+ (UIAlertButton *)button
{
    return [[self alloc] init];
}

+ (UIAlertButton *)buttonWithTitle:(NSString *)title action:(Block)action
{
    UIAlertButton *button = [[self class] button];
    button.title = title;
    button.action = action;
    
    return button;
}

@end
