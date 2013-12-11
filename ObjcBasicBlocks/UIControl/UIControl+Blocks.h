//
//  UIControl+Blocks.h
//  BlockCategories
//
//  Created by Christophe Knage on 01/09/2012.
//  Copyright (c) 2012 Christophe Knage. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Declare a block type tor target actions */
typedef void (^SenderBlock)(id sender);

@interface UIControl (UIControlBlocks)

/**
 * Add an event handler with a block.
 *
 * @param handler:          The block to execute on the UIControlEvents.
 * @param controlEvents:    The UIControlEvents to listen for.
 */
- (void)addEventHandler:(SenderBlock)handler forControlEvents:(UIControlEvents)controlEvents;

/**
 * Remove all event handlers for a specefic UIControlEvents.
 *
 * @param controlEvents:    The UIControlEvents to remove handlers for.
 */
- (void)removeEventHandlersForControlEvents:(UIControlEvents)controlEvents;

/**
 * Check is a UIControlEvents has any handlers.
 *
 * @param controlEvents:    The UIControlEvents to check handlers for.
 * @return Returns true if there is an event handler for the UIControlEvents, otherwise false.
 */
- (BOOL)hasEventHandlersForControlEvents:(UIControlEvents)controlEvents;

@end
