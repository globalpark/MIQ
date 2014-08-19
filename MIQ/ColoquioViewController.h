//
//  ColoquioViewController.h
//  MIQ
//
//  Created by Luis Kentzler on 8/19/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColoquioViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
