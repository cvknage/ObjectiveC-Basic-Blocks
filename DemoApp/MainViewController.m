//
//  MainViewController.m
//  ObjcBasicBlocks
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
    
    // Create and configure instance of UIControl
    UIControl *squareControl = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    squareControl.center = self.view.center;
    squareControl.backgroundColor = [UIColor purpleColor];
    
    // Assign a block to execute on UIControlEventTouchDown
    [squareControl addEventHandler:^(UIControl *sender) {
        NSLog(@"down");
    } forControlEvents:UIControlEventTouchDown];
    
    // Assign a block to execute on UIControlEventTouchUpInside
    [squareControl addEventHandler:^(UIControl *sender) {
        NSLog(@"up");
        
        // Remove all blocks that have been assigned to execute on UIControlEventTouchDown
        [sender removeEventHandlersForControlEvents:UIControlEventTouchDown];
        
        // Create cancel button with factory method
        BBAlertButton *cancelButton = [BBAlertButton buttonWithTitle:@"OK" action:^{
            NSLog(@"cancel button clicked");
        }];
        
        // Create other button by assigning properties
        BBAlertButton *doSomethingButton = [BBAlertButton button];
        doSomethingButton.title = @"Do Something";
        doSomethingButton.action = ^{
            [UIView animateWithDuration:1.0 animations:^{
                sender.backgroundColor = [UIColor redColor];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1.0 animations:^{
                    sender.backgroundColor = [UIColor purpleColor];
                }];
            }];
        };
        
        // Initialize and show alert using BBAlertButton's
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test" message:@"This is a test Alert" cancleButton:cancelButton otherButtons:doSomethingButton, nil];
        [alert show];
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:squareControl];  
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
