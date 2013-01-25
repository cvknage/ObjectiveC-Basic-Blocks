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

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancleButton:(UIAlertButton *)cancleButton otherButtons:(UIAlertButton *)otherButton, ... NS_REQUIRES_NIL_TERMINATION;

@end
