//
//  NSObject+AssociatedValuesTests.m
//  ObjcBasicBlocks
//
//  Created by Christophe Knage on 11/12/2013.
//  Copyright (c) 2013 Christophe Knage. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <objc/runtime.h>
#import "NSObject+AssociatedValues.h"

@interface NSObject_AssociatedValuesTests : SenTestCase

@end

@implementation NSObject_AssociatedValuesTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    objc_removeAssociatedObjects(self);
    
    [super tearDown];
}

- (void)testAssociatedValueForNonExistingKey
{
    NSString *actual = [self associatedValueForKey:@"RandomKey"];
    STAssertNil(actual, @"associated value was found for not existing key.");
}

- (void)testAssociateValueForKey
{
    [self associateValue:@"AssociationTest" withKey:@"test_key"];
    
    NSString *expected = @"AssociationTest";
    NSString *actual = [self associatedValueForKey:@"test_key"];
    STAssertTrue([expected isEqualToString:actual], @"%@ is not equal to %@", expected, actual);
}

@end
