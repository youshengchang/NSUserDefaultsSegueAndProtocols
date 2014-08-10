//
//  ITICreateAccountViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by yousheng chang on 8/9/14.
//  Copyright (c) 2014 InfoTech Inc. All rights reserved.
//

#import "ITICreateAccountViewController.h"

@interface ITICreateAccountViewController ()

@end

@implementation ITICreateAccountViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)createAccountButtonPressed:(UIButton *)sender {
    NSLog(@"In Create User: user: %@, password: %@, confirmed Password %@", self.userNameTextField.text, self.passwordTextField.text, self.confirmPasswordTextField.text);
    if ((self.userNameTextField.text)&&(self.passwordTextField.text)&&(self.confirmPasswordTextField.text)) {
        if([self.passwordTextField.text isEqualToString: self.confirmPasswordTextField.text]){
            self.user = [[ITIUserObject alloc]init];
            self.user.userName = self.userNameTextField.text;
            self.user.password = self.passwordTextField.text;
            [[NSUserDefaults standardUserDefaults] setObject:self.user.userName forKey:USER_NAME];
            [[NSUserDefaults standardUserDefaults] setObject:self.user.password forKey:USER_PASSWORD];
            [[NSUserDefaults standardUserDefaults] synchronize];

            
        }else{
            
            UIAlertView *allert = [[UIAlertView alloc]initWithTitle:@"Alert!" message:@"The confirmed password field is not match with password fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [allert show];
        }
 
    }else{
        UIAlertView *allert = [[UIAlertView alloc]initWithTitle:@"Alert!" message:@"All the fields are required fields!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [allert show];

    }
    NSLog(@"In Create user: userName: %@, password %@", self.user.userName, self.user.password);
    [self.delegate didCreateAccount:self.user];
    
}

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}
@end
