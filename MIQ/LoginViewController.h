//
//  LoginViewController.h
//  MIQ
//
//  Created by Luis Mendoza on 7/31/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;

@end
