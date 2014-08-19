//
//  MainTabBarController.m
//  MIQ
//
//  Created by Work Station on 7/23/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    //------------- Define custom colors -----------//
    
    
    //------------- Deselected Tab Bar Items -----------//
    
    // Images
    
    // Home
    UITabBarItem *home = [self.tabBar.items objectAtIndex:0];
    home.image = [[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    home.selectedImage = [UIImage imageNamed:@"home_active"];
    
    // Eventos
    UITabBarItem *eventos = [self.tabBar.items objectAtIndex:1];
    eventos.image = [[UIImage imageNamed:@"eventos"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    eventos.selectedImage = [UIImage imageNamed:@"eventos_active"];
    
    // Scan
    UITabBarItem *scan = [self.tabBar.items objectAtIndex:2];
    scan.image = [[UIImage imageNamed:@"scan"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    scan.selectedImage = [UIImage imageNamed:@"scan_active"];
    
    
    // Map
    UITabBarItem *mapa = [self.tabBar.items objectAtIndex:3];
    mapa.image = [[UIImage imageNamed:@"mapa"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mapa.selectedImage = [UIImage imageNamed:@"mapa_active"];
    
    // Menú
    UITabBarItem *menu = [self.tabBar.items objectAtIndex:4];
    menu.image = [[UIImage imageNamed:@"menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    menu.selectedImage = [UIImage imageNamed:@"menu_active"];
    
    
    
    
    // Text
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1], NSForegroundColorAttributeName, nil]
                                             forState:UIControlStateNormal];
    //Defined in every ViewController that is child of the TabBar
    
    
    //------------- Background -----------///
    
    
    CGRect frame = CGRectMake(0, 0, 480, 49);
    UIView *v = [[UIView alloc] initWithFrame:frame];
    
    v.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:67.0f/255.0f blue:112.0f/255.0f alpha:1];
    [[self tabBar] insertSubview:v atIndex:0];
    
    //------------- Selected Tab Bat Item -----------///
    
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor colorWithRed:2.0f/255.0f green:119.0f/255.0f blue:178.0f/255.0f alpha:1]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName : [UIColor colorWithRed:2.0f/255.0f green:119.0f/255.0f blue:178.0f/255.0f alpha:1]
                                                        } forState:UIControlStateSelected];
    
    
    
    
    
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
