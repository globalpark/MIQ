//
//  ProfileViewController.h
//  MIQ
//
//  Created by Luis Mendoza on 7/31/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *nameUserLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailUserLabel;
- (IBAction)logout:(id)sender;

@end
