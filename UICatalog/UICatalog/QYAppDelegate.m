//
//  QYAppDelegate.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYAppDelegate.h"
#import "QYTableViewController.h"
#import "QYViewController.h"
#import "ContactsTableViewController.h"


@implementation QYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    QYTableViewController *rootViewCotroller = [[QYTableViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:rootViewCotroller];
    UITabBarItem *navTabBarItem = [[UITabBarItem alloc]initWithTitle:@"UICatalog" image:[UIImage imageNamed:@"UICatalog"] selectedImage:[UIImage imageNamed:@"UICatdlog_highlighted"]];
    navigationController.tabBarItem = navTabBarItem;
    
    QYViewController *viewController = [[QYViewController alloc]init];
    UITabBarItem *vcTabBarItem = [[UITabBarItem alloc]initWithTitle:@"Others" image:[UIImage imageNamed:@"others"] selectedImage:[UIImage imageNamed:@"others_highlighted"]];
    viewController.tabBarItem = vcTabBarItem;
    UINavigationController *naVc = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    ContactsTableViewController *addressViewController = [[ContactsTableViewController alloc]init];
    UITabBarItem *addressTabBarItem = [[UITabBarItem alloc]initWithTitle:@"contacter" image:[UIImage imageNamed:@"tab_contact"] selectedImage:[UIImage imageNamed:@"tab_contact_highlighted"]];
    addressViewController.tabBarItem = addressTabBarItem;
    UINavigationController *addressNavigationVc = [[UINavigationController alloc]initWithRootViewController:addressViewController];
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    [tabBarController setViewControllers:@[navigationController,addressNavigationVc,naVc] animated:YES];
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
    
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

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
