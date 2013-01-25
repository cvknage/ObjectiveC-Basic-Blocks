//
//  UIControl+Blocks.m
//  BlockCategories
//
//  Created by Christophe Knage on 01/09/2012.
//  Copyright (c) 2012 Christophe Knage. All rights reserved.
//

#import "UIControl+Blocks.h"
#import "NSObject+AssociatedValues.h"

static NSString *kControlHandlersKey;

#pragma mark - Private Class

@interface ControlWrapper : NSObject

- (id)initWithHandler:(SenderBlock)aHandler forControlEvents:(UIControlEvents)someControlEvents;

@property (nonatomic, copy) SenderBlock handler;
@property (nonatomic) UIControlEvents controlEvents;

@end

@implementation ControlWrapper

@synthesize handler;
@synthesize controlEvents;

- (id)initWithHandler:(SenderBlock)aHandler forControlEvents:(UIControlEvents)someControlEvents {
    
    self = [super init];
	if (self) {
		self.handler = aHandler;
		self.controlEvents = someControlEvents;
	}
	return self;
}

- (void)invokeBlock:(id)sender {
    
    // Execute tha block handler and pass it the id selder
	self.handler(sender);
}

@end


#pragma mark - Category

@implementation UIControl (UIControlBlocks)

- (void)addEventHandler:(SenderBlock)handler forControlEvents:(UIControlEvents)controlEvents {
    
    // Fake an insancevariable by adding an associative reference or get the reference if it's already added
    NSMutableDictionary *events = [self associatedValueForKey:kControlHandlersKey];
    if (!events) {
		events = [NSMutableDictionary dictionary];
		[self associateValue:events withKey:kControlHandlersKey];
	}
    
    // Get the handlers for the UIControlEvents or create a new set of handlers if non exist
    NSNumber *key = [NSNumber numberWithUnsignedInteger:controlEvents];
	NSMutableSet *handlers = [events objectForKey:key];
	if (!handlers) {
		handlers = [NSMutableSet set];
		[events setObject:handlers forKey:key];
	}
    
    // Save the handler for the UIControlEvents in a wrapper object
    ControlWrapper *target = [[ControlWrapper alloc] initWithHandler:handler forControlEvents:controlEvents];
    
    // Add the tartet wrapper object in the set of handlers for the UIControlEvents
	[handlers addObject:target];
    
    // Add a target & action for the UIControl for the UIControlEvents
	[self addTarget:target action:@selector(invokeBlock:) forControlEvents:controlEvents];
}

- (void)removeEventHandlersForControlEvents:(UIControlEvents)controlEvents {
	
    // Fake an insancevariable by adding an associative reference or get the reference if it's already added
    NSMutableDictionary *events = [self associatedValueForKey:kControlHandlersKey];
	if (!events) {
		events = [NSMutableDictionary dictionary];
		[self associateValue:events withKey:kControlHandlersKey];
	}
	
    // Get the handlers for the UIControlEvents or return if non exist
	NSNumber *key = [NSNumber numberWithUnsignedInteger:controlEvents];
	NSSet *handlers = [events objectForKey:key];
	if (!handlers) {
        return;
    }
    
    // Enumarate handlers and remove the target for the specefied UIControlEvents
    [handlers enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
            [self removeTarget:obj action:NULL forControlEvents:controlEvents];
	}];
	
    // Remove the handlers for the UIControlEvents
	[events removeObjectForKey:key];
}

- (BOOL)hasEventHandlersForControlEvents:(UIControlEvents)controlEvents {
    
    // Fake an insancevariable by adding an associative reference or get the reference if it's already added
    NSMutableDictionary *events = [self associatedValueForKey:kControlHandlersKey];
	if (!events) {
		events = [NSMutableDictionary dictionary];
		[self associateValue:events withKey:kControlHandlersKey];
	}
	
    // Get the handlers for the UIControlEvents if non exist return NO else return YES
	NSNumber *key = [NSNumber numberWithUnsignedInteger:controlEvents];
	NSSet *handlers = [events objectForKey:key];
	if (!handlers) {
        return NO;
    }
	
	return handlers.count;
}

@end
