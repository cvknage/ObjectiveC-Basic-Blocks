//
//  UIAlertButton.h
//  BlockCategories
//
//  Created by Christophe Knage on 25/01/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BlockGlobals.h"

@interface UIAlertButton : NSObject

@property (strong, nonatomic) NSString *title;
@property (copy, nonatomic) void(^action)();

/**
 * Static initializer.
 *
 * @return Returns an instance of UIAlertButton.
 */
+ (UIAlertButton *)button;

/**
 * Static initializer with title and action.
 *
 * @param title:    The title of the button.
 * @param action:   The block to execute when the button is clicked.
 * @return Returns an instance of UIAlertButton initialized with the title and action.
 */
+ (UIAlertButton *)buttonWithTitle:(NSString *)title action:(Block)action;

@end
