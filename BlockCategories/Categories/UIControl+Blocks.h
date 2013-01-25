//
//  UIControl+Blocks.h
//  BlockCategories
//
//  Created by Christophe Knage on 01/09/2012.
//  Copyright (c) 2012 Christophe Knage. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BlockGlobals.h"

@interface UIControl (UIControlBlocks)

- (void)addEventHandler:(SenderBlock)handler forControlEvents:(UIControlEvents)controlEvents;
- (void)removeEventHandlersForControlEvents:(UIControlEvents)controlEvents;
- (BOOL)hasEventHandlersForControlEvents:(UIControlEvents)controlEvents;

@end
