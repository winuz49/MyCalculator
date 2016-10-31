//
//  AppDelegate.m
//  MyCalculatorDemo
//
//  Created by wzj on 2016/10/29.
//  Copyright © 2016年 wzj. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "WeightViewController.h"
#import "AdvancedViewController.h"
#import "GalleryTabViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    // 获得storyboard对象
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewController *calViewController=[mainStoryBoard instantiateViewControllerWithIdentifier:@"Calculator"];
    WeightViewController *weightViewController=[mainStoryBoard instantiateViewControllerWithIdentifier:@"WeightAnalyse"];
    GalleryTabViewController *galleryTabViewController=[[GalleryTabViewController alloc]init ];
   
   
    
    UITabBarItem *settingItem = [[UITabBarItem alloc] initWithTitle:@"计算器" image:[UIImage imageNamed: @""] tag:5];
    calViewController.tabBarItem = settingItem;
     UINavigationController *navigationController=[[UINavigationController alloc] initWithRootViewController:calViewController];
    galleryTabViewController.viewControllers=@[navigationController,weightViewController];
    
    
    //注意默认情况下UITabBarController在加载子视图时是懒加载的，所以这里调用一次contactController，否则在第一次展示时只有第一个控制器tab图标，contactController的tab图标不会显示
    for (UIViewController *controller in galleryTabViewController.viewControllers) {
        UIViewController * view= controller.view;
    }
    
    _window.rootViewController=galleryTabViewController;
    [_window makeKeyAndVisible];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
