//
//  UIControl+BlocksTests.m
//  ObjcBasicBlocks
//
//  Created by Christophe Knage on 11/12/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "UIControl+Blocks.h"

@interface UIControl_BlocksTests : SenTestCase

@property (strong, nonatomic) UIControl *control;
@property (strong, nonatomic) NSString *testString;

@end

@implementation UIControl_BlocksTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    
    self.control = [[UIControl alloc] init];
    self.testString = @"NOT_MODIFIED";
    
    __weak typeof(self) self_weak_ = self;
    [self.control addEventHandler:^(id sender) {
        __strong typeof(self) self = self_weak_;
        self.testString = @"MODIFIED";
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    
    self.control = nil;
    self.testString = nil;
    
    [super tearDown];
}

- (void)testAddEventHandlerForControlEvents
{
    [self.control sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    NSString *expected = @"MODIFIED";
    NSString *actual = self.testString;
    STAssertEqualObjects(expected, actual, @"%@ is not equal to %@", expected, actual);
}

- (void)testRemoveEventHandlersForControlEvents
{
    [self.control removeEventHandlersForControlEvents:UIControlEventTouchUpInside];
    [self.control sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    NSString *expected = @"NOT_MODIFIED";
    NSString *actual = self.testString;
    STAssertEqualObjects(expected, actual, @"%@ is not equal to %@", expected, actual);
}

- (void)testHasEventHandlersForControlEvents
{
    STAssertTrue([self.control hasEventHandlersForControlEvents:UIControlEventTouchUpInside], @"Must be true when events have been added");
}

@end
