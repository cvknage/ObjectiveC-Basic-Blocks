//
//  UIAlertView+Blocks.m
//  BlockCategories
//
//  Created by Christophe Knage on 25/01/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import "UIAlertView+Blocks.h"
#import "NSObject+AssociatedValues.h"

static NSString *kButtonBlocksKey;

@implementation UIAlertView (Blocks)

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancleButton:(UIAlertButton *)cancleButton otherButtons:(UIAlertButton *)otherButton, ...
{
    self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancleButton.title otherButtonTitles:nil];
    if (self) {
        NSMutableArray *buttonsArray = [NSMutableArray array];
        
        UIAlertButton *variadicItem;
        va_list variadicList;
        if (otherButton) {
            [buttonsArray addObject:otherButton];
            va_start(variadicList, otherButton);
            while ((variadicItem = va_arg(variadicList, UIAlertButton *))) {
                [buttonsArray addObject:variadicItem];
            }
            va_end(variadicList);
        }
        
        for (UIAlertButton *button in buttonsArray) {
            [self addButtonWithTitle:button.title];
        }
        
        if (cancleButton) {
            [buttonsArray insertObject:cancleButton atIndex:0];
        }
        
        [self associateValue:buttonsArray withKey:kButtonBlocksKey];
    }
    return self;
}

- (NSInteger)addButton:(UIAlertButton *)button
{
    NSMutableArray *buttonsArray = [self associatedValueForKey:kButtonBlocksKey];
    
    NSInteger index = [self addButtonWithTitle:button.title];
    [buttonsArray addObject:button];
    
    return index;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0) {
        NSArray *buttonsArray = [self associatedValueForKey:kButtonBlocksKey];
        UIAlertButton *alertButton = [buttonsArray objectAtIndex:buttonIndex];
        
        if (alertButton.action) {
            alertButton.action();
        }
    }
    
    [self associateValue:nil withKey:kButtonBlocksKey];
}

@end
