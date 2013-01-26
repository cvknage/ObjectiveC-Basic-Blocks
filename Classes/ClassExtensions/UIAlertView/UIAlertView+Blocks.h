//
//  UIAlertView+Blocks.h
//  BlockCategories
//
//  Created by Christophe Knage on 25/01/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIAlertButton.h"

@interface UIAlertView (Blocks)

/**
 * Initialize a UIAlertView using blocks.
 *
 * @param title:        The title of the UIAlertView.
 * @param message:      The message of the UIAlertView.
 * @param cancleButton: An instance of UIAlertButton to specefy the cancle button.
 * @param otherButtons: A nil terminated list of UIAlertButton(s).
 * @return Newly initialized alert view (ready to be shown).
 */
- (id)initWithTitle:(NSString *)title message:(NSString *)message cancleButton:(UIAlertButton *)cancleButton otherButtons:(UIAlertButton *)otherButton, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * Add a UIAlertButton to the UIAlertView.
 *
 * @param button: An instance of UIAlertButton to specefy the button to add.
 * @return The index of the new button. Button indices start at 0 and increase in the order they are added.
 */
- (NSInteger)addButton:(UIAlertButton *)button;

@end
