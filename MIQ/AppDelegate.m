//
//  AppDelegate.m
//  MIQ
//
//  Created by Work Station on 7/8/14.
//  Copyright (c) 2014 GlobalPark. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //Datos de App de Parse
    [Parse setApplicationId:@"MsvqKK0JbCULl8mRG0syxpnBEZQTE7YdCO6GtvW9"
                  clientKey:@"oF7XDVCIerjb5Y1K5V7T6H61pJ16WRKGWUnXHNuF"];
    
    //Usage Tracking de Parse
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    //Parse-Facebook Connection
    [PFFacebookUtils initializeFacebook];
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

-(void) didFinishLaunchingWithOptions{

}

//Needed for Facebook Login
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
