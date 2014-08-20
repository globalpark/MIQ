//
//  SignupViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 7/31/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "SignupViewController.h"
#import "Reachability.h"
#import <Parse/Parse.h>

@interface SignupViewController ()

@end

@implementation SignupViewController



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

-(void)viewWillAppear:(BOOL)animated
{
    //---- Configuration for Navigation Bar ----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarSIN"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.hidden = NO;

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
    }else{//Data was entered by the user
        Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
        NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
        if (networkStatus == NotReachable) {//User is not reachable
            NSLog(@"There IS NO internet connection");
            //Show error message
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Por favor verifica tu conexión a la red." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        } else {//User is reachable
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
                if (!error) {//Success! Show next View.
                    //Show User message of succesful registration.
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Bienvenido" message:@"¡Gracias por registrarte!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    [alertView show];
                    [self performSegueWithIdentifier:@"afterRegistration" sender:self];
                } else {//Registration failed.
                    NSString *errorString = [error userInfo][@"error"];
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error al guardar tus datos. Verifica tu conexión a la red." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    [alertView show];
                }
            }];
        }
    }
    
    
}
@end
