//
//  EventoDetailViewController.h
//  MIQ
//
//  Created by Luis Mendoza on 9/28/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EventoDetailViewController : UIViewController <UIScrollViewDelegate,UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) PFObject *eventoPFObject;
@property (strong, nonatomic) IBOutlet UILabel *tituloLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistaLabel;

@end
