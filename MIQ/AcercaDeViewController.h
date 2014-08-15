//
//  AcercaDeViewController.h
//  MIQ
//
//  Created by Luis Kentzler on 8/8/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcercaDeViewController : UIViewController <UIScrollViewDelegate,UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewBar;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
