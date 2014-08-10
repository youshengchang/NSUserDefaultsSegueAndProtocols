//
//  ITISignInViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by yousheng chang on 8/9/14.
//  Copyright (c) 2014 InfoTech Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITICreateAccountViewController.h"

@interface ITISignInViewController : UIViewController <ITICreateAccountViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)createAccountButtonItemPressed:(UIBarButtonItem *)sender;

- (IBAction)loginButtonPressed:(UIButton *)sender;

@end
