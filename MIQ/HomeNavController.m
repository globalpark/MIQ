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
    
    
    
    
    //----------------- Add set up to Navigation Bar -----------------//
    
    // !!!! Logos will be added as a Background image to the Navigation Bar on each view
    
    
    /*
    
    // Logo Impulso
    if ( self == [self.navigationController.viewControllers objectAtIndex:0] )
    {
        CGRect frameImpulso = CGRectMake(262.0, 28.0, 48.0, 30.0);
        UIImageView *logoImpulso = [ [UIImageView alloc]initWithImage:[UIImage imageNamed:@"logoGTO"] ];
        logoImpulso.frame = frameImpulso;
        [self.view addSubview:logoImpulso];
    }
    
    
    // Logo GTO
    CGRect frameLogoGto = CGRectMake(10.0, 28.0, 80.0, 30.0);
    UIImageView *logoGTO = [ [UIImageView alloc]initWithImage:[UIImage imageNamed:@"impulsoGTO"] ];
    logoGTO.frame = frameLogoGto;
    [self.view addSubview:logoGTO];
     
    */
    
    
    
    // Back button and chevron color
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1]];
    
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1],
       NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Medium" size:14]
       }
     
     
                                                                                            forState:UIControlStateNormal];

    
    
    //Change Navigation Bar Background
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarSIN"] forBarMetrics:UIBarMetricsDefault];
        


}




//----------------- Change Status Bar Style to Light -----------------//


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
