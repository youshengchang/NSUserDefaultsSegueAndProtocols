//
//  ITISignInViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by yousheng chang on 8/9/14.
//  Copyright (c) 2014 InfoTech Inc. All rights reserved.
//

#import "ITISignInViewController.h"





@interface ITISignInViewController ()

@end

@implementation ITISignInViewController

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.destinationViewController isKindOfClass:[ITICreateAccountViewController class]]){
        ITICreateAccountViewController *createAccountViewController = segue.destinationViewController;
        createAccountViewController.delegate = self;
        
    }
    if ([sender isKindOfClass:[UIButton class]]) {
        if([segue.destinationViewController isKindOfClass:[ITIViewController class]]){
            ITIViewController *userViewController = segue.destinationViewController;
            userViewController.user = self.user;
            NSLog(@"user.userName: %@, password: %@", self.user.userName, self.user.password);
            NSLog(@"userViewController's user.userName: %@, password: %@", userViewController.user.userName, userViewController.user.password);

            
        }
    }
    
}


#pragma mark implements the ITICreateAccountViewControllerDelegate methods
-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];

}
-(void)didCreateAccount:(ITIUserObject *)newUser
{
    self.user = [[ITIUserObject alloc]init];
    self.user.userName = newUser.userName;
    self.user.password = newUser.password;
    NSLog(@"InSignInViewController: userName: %@, password: %@", self.user.userName, self.user.password);
    
     [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - actions
- (IBAction)createAccountButtonItemPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"createAccountViewControllerSegue" sender:sender];
     
}

- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    NSString *name = [[NSUserDefaults standardUserDefaults]objectForKey:USER_NAME];
    NSString *password = [[NSUserDefaults standardUserDefaults]objectForKey:USER_PASSWORD];
    if([self.userNameTextField.text isEqualToString:name] && [self.passwordTextField.text isEqualToString:password]){
        self.user = [[ITIUserObject alloc]init];
        self.user.userName = self.userNameTextField.text;
        self.user.password = self.passwordTextField.text;
        [self performSegueWithIdentifier:@"userInfoViewControllerSegue" sender:sender];
    }else{
       UIAlertView *allert = [[UIAlertView alloc]initWithTitle:@"Alert!!!" message:@"The user name or password is not correct!" delegate:nil
    cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [allert show];
  
        
    }
}

#pragma mark helper methods

@end
