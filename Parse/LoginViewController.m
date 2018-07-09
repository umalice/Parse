//
//  LoginViewController.m
//  Parse
//
//  Created by Alice Park on 7/9/18.
//  Copyright © 2018 Alice Park. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)presentAlertWithTitle:(NSString *)title fromViewController:(UIViewController *)parentViewController {
    
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:title message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {// handle response here.
    }];
    
    [alertViewController addAction:okAction];
    
    [parentViewController presentViewController:alertViewController animated:YES completion:nil];
    
    
}

- (void)registerUser {
    
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            
            [LoginViewController presentAlertWithTitle:@"Error signing up" fromViewController:self];
            
        } else {
            NSLog(@"User registered successfully");
            
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        }
    }];
}

- (void)loginUser {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
            
            [LoginViewController presentAlertWithTitle:@"Error logging in" fromViewController:self];
            
            
        } else {
            NSLog(@"User logged in successfully");
            
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];

        }
    }];
}


- (IBAction)didSignup:(id)sender {
    
    if([self.usernameField.text isEqual:@""]) {
        [LoginViewController presentAlertWithTitle:@"Please enter a username" fromViewController:self];
    }
    
    if([self.passwordField.text isEqual:@""]) {
        
        [LoginViewController presentAlertWithTitle:@"Please enter a password" fromViewController:self];
    }

    
    [self registerUser];
}


- (IBAction)didLogin:(id)sender {
    [self loginUser];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
