//
//  UIAlertView+Blocks.h
//  ObjcBasicBlocks
//
//  Created by Christophe Knage on 25/01/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BBAlertButton.h"

@interface UIAlertView (Blocks)

/**
 * Initialize a UIAlertView using blocks.
 *
 * @param title        The title of the UIAlertView.
 * @param message      The message of the UIAlertView.
 * @param cancleButton An instance of BBAlertButton to specefy the cancle button.
 * @param otherButton A nil terminated list of BBAlertButton(s).
 * @return Newly initialized alert view (ready to be shown).
 */
- (id)initWithTitle:(NSString *)title message:(NSString *)message cancleButton:(BBAlertButton *)cancleButton otherButtons:(BBAlertButton *)otherButton, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * Add a BBAlertButton to the UIAlertView.
 *
 * @param button An instance of BBAlertButton to specefy the button to add.
 * @return The index of the new button. Button indices start at 0 and increase in the order they are added.
 */
- (NSInteger)addButton:(BBAlertButton *)button;

@end
