//
//  ITICreateAccountViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by yousheng chang on 8/9/14.
//  Copyright (c) 2014 InfoTech Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITIUserObject.h"

#define USER_NAME @"username"
#define USER_PASSWORD @"password"
#define USER_PROFILE @"user profile"

@protocol ITICreateAccountViewControllerDelegate <NSObject>

@required
-(void)didCancel;
-(void)didCreateAccount: (ITIUserObject *)newUser;

@end

@interface ITICreateAccountViewController : UIViewController
@property   id <ITICreateAccountViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (strong, nonatomic) ITIUserObject *user;

- (IBAction)createAccountButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;

@end
