//
//  EventoDayViewController.h
//  MIQ
//
//  Created by Luis Mendoza on 9/28/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventoDayViewController : UIViewController <UIScrollViewDelegate,UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *dayTitleLabel;

@property (strong, nonatomic) NSString *diaEvento;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *eventos;

@end
