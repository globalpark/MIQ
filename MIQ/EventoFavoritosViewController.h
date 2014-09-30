//
//  EventoFavoritosViewController.h
//  MIQ
//
//  Created by Luis Mendoza on 9/29/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EventoFavoritosViewController : UIViewController <UIScrollViewDelegate,UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *favoritos;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
