//
//  LoginViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 7/31/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

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
    //Esconder el botón de atrás de la navegación
    self.navigationItem.hidesBackButton = YES;
    
    /* Prueba Parse
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground]; */

}

- (IBAction)login:(id)sender {
    NSString *username = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([username length] == 0 || [password length] == 0 ){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Es necesario proporcionar email y contraseña." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }else{
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if(error){
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"¡Lo sentimos! Se generó un error. Revisa que tu conexión internet." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertView show];
            }else{
                [self.navigationController popToRootViewControllerAnimated:YES];
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
