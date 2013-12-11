//
//  BBAlertButtonTests.m
//  ObjcBasicBlocks
//
//  Created by Christophe Knage on 11/12/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "BBAlertButton.h"

@interface BBAlertButtonTests : SenTestCase

@end

@implementation BBAlertButtonTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testButton
{
    BBAlertButton *button = [BBAlertButton button];
    STAssertNotNil(button, @"Must not return nil.");
    STAssertNil(button.title, @"Must not be set.");
    STAssertNil(button.action, @"Must not be set.");
}

- (void)testButtonWithNilTitleAndNilAction
{
    STAssertThrows([BBAlertButton buttonWithTitle:nil action:nil], @"Title parameter must be present.");
}

- (void)testButtonWithNilTitle
{
    STAssertThrows([BBAlertButton buttonWithTitle:nil action:^{}], @"Title parameters must be present.");
}

- (void)testButtonWithNilAction
{
    BBAlertButton *button = [BBAlertButton buttonWithTitle:@"" action:nil];
    STAssertNotNil(button, @"Must not return nil.");
    STAssertNotNil(button.title, @"Must be set.");
    STAssertNil(button.action, @"Must not be set.");
}

- (void)testButtonWithTitleAndAction
{
    BBAlertButton *button = [BBAlertButton buttonWithTitle:@"title" action:^{}];
    
    { // Test setting button title
        NSString *expected = @"title";
        NSString *actual = button.title;
        STAssertEqualObjects(expected, actual, @"The title must be set.");
    }
    
    { // Test setting button action
        STAssertNotNil(button.action, @"Button action must be set.");
    }
}

- (void)testButtonActionExecution
{
    __block NSString *testString = @"NOT_MODIFIED";
    BBAlertButton *button = [BBAlertButton button];
    button.action = ^{
        testString = @"MODIFIED";
    };
    button.action();
    
    NSString *expected = @"MODIFIED";
    NSString *actual = testString;
    STAssertEqualObjects(expected, actual, @"%@ is not equal to %@", expected, actual);
}

@end
