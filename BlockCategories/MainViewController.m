//
//  MainViewController.m
//  BlockCategories
//
//  Created by Christophe Knage on 01/09/2012.
//  Copyright (c) 2012 Christophe Knage. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
