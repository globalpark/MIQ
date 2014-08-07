//
//  ProfileViewController.m
//  MIQ
//
//  Created by Luis Mendoza on 7/31/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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

-(void)viewDidAppear:(BOOL)animated{
    
    //Load user info here instead of viewDidLoad to keep profile up to date.
    PFUser *user = [PFUser currentUser];
    
    if(!user){
        [self performSegueWithIdentifier:@"loginAfterLogOut" sender:self];
    }else{
        self.firstNameUserLabel.text = user[@"firstName"];
        self.lastNameUserLabel.text = user[@"lastName"];
        self.emailUserLabel.text = user.email;
    }
    
}

- (IBAction)logout:(id)sender {
    
    //Log Out
    [PFUser logOut];
    self.firstNameUserLabel.text = nil;
    self.lastNameUserLabel.text = nil;
    self.emailUserLabel.text = nil;
    
    [self performSegueWithIdentifier:@"loginAfterLogOut" sender:self];
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
