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

+ (id)button;
+ (UIAlertButton *)buttonWithTitle:(NSString *)title action:(Block)action;

@end
