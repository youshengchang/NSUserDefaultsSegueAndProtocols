//
//  ITIViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by yousheng chang on 8/9/14.
//  Copyright (c) 2014 InfoTech Inc. All rights reserved.
//

#import "ITIViewController.h"
#import "ITICreateAccountViewController.h"

@interface ITIViewController ()

@end

@implementation ITIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"user Name: %@, password: %@", self.user.userName, self.user.password);
    //self.userNameLabel.text = self.user.userName;
    //self.passwordLabel.text = self.user.password;
    self.userNameLabel.text = [[NSUserDefaults standardUserDefaults]objectForKey:USER_NAME];
    self.passwordLabel.text = [[NSUserDefaults standardUserDefaults]objectForKey:USER_PASSWORD];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
