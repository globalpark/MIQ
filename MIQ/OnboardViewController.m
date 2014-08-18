 //
//  OnboardViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 8/1/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "OnboardViewController.h"
#import <Parse/Parse.h>
#import "Reachability.h"

@interface OnboardViewController ()

@end

@implementation OnboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)loginWithFacebook:(id)sender {
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    //Check network connectivity
    if (networkStatus == NotReachable) {//User IS NOT reachable
        NSLog(@"There IS NO internet connection");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Por favor verifica tu conexión a la red." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    } else {//User is reachable, try Facebook Login
        NSLog(@"There IS internet connection");
        [PFFacebookUtils logInWithPermissions:@[@"public_profile", @"user_birthday", @"email"] block:^(PFUser *user, NSError *error) {
            if (!user) {//User cancelled or there was an error with Facebook.
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Por favor selecciona una opción para registrarte." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertView show];
            } else {//Success! Get the rest of the user data
                [FBRequestConnection
                 startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                     if (!error) {
                         //Get the current authorized user
                         PFUser *user = [PFUser currentUser];
                         
                         //Get the User info from the result
                         user[@"fbId"] = [result objectForKey:@"id"];
                         user[@"firstName"] = [result objectForKey:@"first_name"];
                         user[@"lastName"] = [result objectForKey:@"last_name"];
                         user[@"country"] = [[result objectForKey:@"hometown"] objectForKey:@"name"];
                         user[@"email"] = [result objectForKey:@"email"];
                         [user saveInBackground];
                     }
                 }];
                //Registered users should be notified that they are already registered and sent back to main view controller.
                if(!user.isNew){//User was already registered with Facebook
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Registro con Facebook" message:@"Ya estás registrado. ¡Gracias!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    [alertView show];
                }//Show next View.
                [self performSegueWithIdentifier:@"afterFacebook" sender:self];
            }
        }];
        
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
