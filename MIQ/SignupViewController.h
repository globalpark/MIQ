//
//  SignupViewController.h
//  MIQ
//
//  Created by Luis Mendoza on 7/31/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)signup:(id)sender;

@end
