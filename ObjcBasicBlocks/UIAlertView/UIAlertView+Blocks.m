//
//  UIAlertView+Blocks.m
//  ObjcBasicBlocks
//
//  Created by Christophe Knage on 25/01/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import "UIAlertView+Blocks.h"
#import "NSObject+AssociatedValues.h"

static NSString *kButtonBlocksKey;

@implementation UIAlertView (Blocks)

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancleButton:(BBAlertButton *)cancleButton otherButtons:(BBAlertButton *)otherButton, ...
{
    self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancleButton.title otherButtonTitles:nil];
    if (self) {
        NSMutableArray *buttonsArray = [NSMutableArray array];
        
        BBAlertButton *variadicItem;
        va_list variadicList;
        if (otherButton) {
            [buttonsArray addObject:otherButton];
            va_start(variadicList, otherButton);
            while ((variadicItem = va_arg(variadicList, BBAlertButton *))) {
                [buttonsArray addObject:variadicItem];
            }
            va_end(variadicList);
        }
        
        for (BBAlertButton *button in buttonsArray) {
            [self addButtonWithTitle:button.title];
        }
        
        if (cancleButton) {
            [buttonsArray insertObject:cancleButton atIndex:0];
        }
        
        [self associateValue:buttonsArray withKey:kButtonBlocksKey];
    }
    return self;
}

- (NSInteger)addButton:(BBAlertButton *)button
{
    NSMutableArray *buttonsArray = [self associatedValueForKey:kButtonBlocksKey];
    
    NSInteger index = [self addButtonWithTitle:button.title];
    [buttonsArray addObject:button];
    
    return index;
}


#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0) {
        NSArray *buttonsArray = [self associatedValueForKey:kButtonBlocksKey];
        BBAlertButton *alertButton = [buttonsArray objectAtIndex:(NSUInteger)buttonIndex];
        
        if (alertButton.action) {
            alertButton.action();
        }
    }
    
    [self associateValue:nil withKey:kButtonBlocksKey];
}

@end
