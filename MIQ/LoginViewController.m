//
//  LoginViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 7/31/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "Reachability.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    
    /* Prueba Parse
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground]; */

}

- (IBAction)login:(id)sender {
    NSString *username = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //Validate that user entered data.
    if([username length] == 0 || [password length] == 0 ){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Es necesario proporcionar email y contraseña." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }else{//User DID enter data
        //Validate user connectivity
        Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
        NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
        if (networkStatus == NotReachable) {//User is not reachable
            NSLog(@"There IS NO internet connection");
            //Show error message
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Por favor verifica tu conexión a la red." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        } else {//User is reachable
            //Try to log into Parse
            [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
                if(error){//Error, show message
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Los datos que proporcionaste son incorrectos, inténtalo nuevamente." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    [alertView show];
                }else{//Success! Show next View.
                    [self performSegueWithIdentifier:@"afterLogin" sender:self];
                }
            }];
        }
    }
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


@end
