//
//  HomeNavController.m
//  MIQ
//
//  Created by Work Station on 7/24/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "HomeNavController.h"

@interface HomeNavController ()

@end

@implementation HomeNavController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    CGRect frame = CGRectMake(0.0, 0.0, 94.0, 33.0);
    UIImageView *image = [ [UIImageView alloc]initWithImage:[UIImage imageNamed:@"impulsamos"] ];
    image.frame = frame;
    [self.view addSubview:image];
    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
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
