//
//  UIAlertView+BlocksTests.m
//  ObjcBasicBlocks
//
//  Created by Christophe Knage on 11/12/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "UIAlertView+Blocks.h"

@interface UIAlertView_BlocksTests : SenTestCase

@property (strong, nonatomic) UIAlertView *alertView;

@end

@implementation UIAlertView_BlocksTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    
    BBAlertButton *cancelButton = [BBAlertButton buttonWithTitle:@"OK" action:nil];
    BBAlertButton *actionButton = [BBAlertButton buttonWithTitle:@"doSomething" action:^{
        // do nothing
    }];
    self.alertView = [[UIAlertView alloc] initWithTitle:@"TEST" message:@"UIAlertView with blocks test" cancleButton:cancelButton otherButtons:actionButton, nil];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    
    self.alertView = nil;
    
    [super tearDown];
}

- (void)testInitialization
{
    STAssertTrue([self.alertView isKindOfClass:[UIAlertView class]], @"Must init UIAlertView class");
    
    { // Test setting title
        NSString *expected = @"TEST";
        NSString *actual = self.alertView.title;
        STAssertEqualObjects(expected, actual, @"%@ is not equal to %@", expected, actual);
    }
    
    { // Test number of buttons
        NSInteger expected = 2;
        NSInteger actual = self.alertView.numberOfButtons;
        STAssertTrue((expected == actual), @"%d is not equal to %d", expected, actual);
    }
    
    { // Test delegate is assigned to UIAlertView
        UIAlertView *expected = self.alertView;
        UIAlertView *actual = self.alertView.delegate;
        STAssertEqualObjects(expected, actual, @"The delegate must be the UIAlertView");
    }
}

- (void)testAddButton
{
    BBAlertButton *thirdButton = [BBAlertButton button];
    [self.alertView addButton:thirdButton];
    
    NSInteger expected = 3;
    NSInteger actual = self.alertView.numberOfButtons;
    STAssertTrue((expected == actual), @"%d is not equal to %d", expected, actual);
}

@end
