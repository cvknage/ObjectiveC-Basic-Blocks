//
//  MainViewController.m
//  BlockCategories
//
//  Created by Christophe Knage on 01/09/2012.
//  Copyright (c) 2012 Christophe Knage. All rights reserved.
//

#import "MainViewController.h"

#import "UIControl+Blocks.h"
#import "UIAlertView+Blocks.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // initializations
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIControl *testControl = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    testControl.center = self.view.center;
    testControl.backgroundColor = [UIColor purpleColor];
    
    [testControl addEventHandler:^(id sender) {
        NSLog(@"down");
    } forControlEvents:UIControlEventTouchDown];
    
    [testControl addEventHandler:^(id sender) {
        NSLog(@"up");
        [sender removeEventHandlersForControlEvents:UIControlEventTouchDown];
        
        BBAlertButton *cancleButton = [BBAlertButton buttonWithTitle:@"OK" action:^{
            NSLog(@"cancle button clicked");
        }];
        
        BBAlertButton *doSomethingButton = [BBAlertButton button];
        doSomethingButton.title = @"Do Something";
        doSomethingButton.action = ^{
            
            [UIView animateWithDuration:1.0 animations:^{
                testControl.backgroundColor = [UIColor redColor];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1.0 animations:^{
                    testControl.backgroundColor = [UIColor purpleColor];
                }];
            }];
            
            testControl.backgroundColor = [UIColor redColor];
        };
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test" message:@"This is a test Alert" cancleButton:cancleButton otherButtons:doSomethingButton, nil];
        [alert show];
        
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testControl];  
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
