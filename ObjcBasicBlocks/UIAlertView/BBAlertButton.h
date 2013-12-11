//
//  BBAlertButton.h
//  ObjcBasicBlocks
//
//  Created by Christophe Knage on 25/01/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBAlertButton : NSObject

@property (strong, nonatomic) NSString *title;
@property (copy, nonatomic) void(^action)();

/**
 * Static initializer.
 *
 * @return Returns an instance of BBAlertButton.
 */
+ (BBAlertButton *)button;

/**
 * Static initializer with title and action.
 *
 * @param title    The title of the button.
 * @param action   The block to execute when the button is clicked.
 * @return Returns an instance of BBAlertButton initialized with the title and action.
 */
+ (BBAlertButton *)buttonWithTitle:(NSString *)title action:(dispatch_block_t)action;

@end
