//
//  OnboardViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 8/1/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "OnboardViewController.h"
#import <Parse/Parse.h>

@interface OnboardViewController ()

@end

@implementation OnboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Esconder el botón de atrás de la navegación
    self.navigationItem.hidesBackButton = YES;
    
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

- (IBAction)loginWithFacebook:(id)sender {
    
    [PFFacebookUtils logInWithPermissions:@[@"public_profile", @"user_birthday", @"email"] block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            [FBRequestConnection
             startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                 if (!error) {
                     //Get the current authorized user
                     PFUser *user = [PFUser currentUser];
                     NSLog(@"Result: %@", result);
                     //Get the User info from the result
                     user[@"fbId"] = [result objectForKey:@"id"];
                     user[@"firstName"] = [result objectForKey:@"first_name"];
                     user[@"lastName"] = [result objectForKey:@"last_name"];
                     user[@"country"] = [[result objectForKey:@"hometown"] objectForKey:@"name"];
                     user[@"email"] = [result objectForKey:@"email"];
                     [user saveInBackground];
                 }
             }];
        } else {
            [FBRequestConnection
             startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                 if (!error) {
                     //Get the current authorized user
                     PFUser *user = [PFUser currentUser];
                     NSLog(@"Result: %@", result);
                     //Get the User info from the result
                     user[@"fbId"] = [result objectForKey:@"id"];
                     user[@"firstName"] = [result objectForKey:@"first_name"];
                     user[@"lastName"] = [result objectForKey:@"last_name"];
                     user[@"country"] = [[result objectForKey:@"hometown"] objectForKey:@"name"];
                     user[@"email"] = [result objectForKey:@"email"];
                     [user saveInBackground];
                 }
             }];
        }
    }];
    
}
@end
