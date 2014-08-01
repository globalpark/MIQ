//
//  SignupViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 7/31/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "SignupViewController.h"
#import <Parse/Parse.h>

@interface SignupViewController ()

@end

@implementation SignupViewController

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

- (IBAction)signup:(id)sender {
    //Get user data
    NSString *firstName = [self.firstNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *lastName = [self.lastNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *country = [self.countryTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *state = [self.stateTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //Validate data. Could be improved
    if([firstName length] == 0 || [lastName length] == 0 || [email length] == 0 || [country length] == 0  || [state length] == 0  || [password length] == 0 ){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Asegurate de llenar todos los datos." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }else{
        //Create PFUser
        PFUser *newUser = [PFUser user];
        
        //Save data to newUser object.
        newUser[@"firstName"] = firstName;
        newUser[@"lastName"] = lastName;
        newUser.username = email; //email becomes username identifier to validate with Parse.
        newUser.email = email;
        newUser[@"country"] = country;
        newUser[@"state"] = state;
        newUser.password = password;
        
        //Save Data to Parse.
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            } else {
                NSString *errorString = [error userInfo][@"error"];
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Make sure you enter a username and password!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertView show];
            }
        }];
        
    }
}
@end
