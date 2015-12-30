//
//  AppDelegate.m
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/24.
//  Copyright © 2015年 何光. All rights reserved.
//

#import "AppDelegate.h"
#import "ShouYeViewController.h"
#import "LunTanViewController.h"
#import "ZiXunViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    ShouYeViewController *syv = [[ShouYeViewController alloc]init];
    NSString *normalImageName = [NSString stringWithFormat:@"552cc582248d4_32"];
    UIImage *normalImage = [[UIImage imageNamed:normalImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSString *selectedImageName = [NSString stringWithFormat:@"552cc57324e26_32"];
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:@"首页" image:normalImage selectedImage:selectedImage];
    syv.tabBarItem = item;
    UINavigationController *sy = [[UINavigationController alloc]initWithRootViewController:syv];
    
    LunTanViewController *ltv = [[LunTanViewController alloc]init];
    NSString *normalImageName1 = [NSString stringWithFormat:@"552cc3c0c2549_32"];
    UIImage *normalImage1 = [[UIImage imageNamed:normalImageName1]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSString *selectedImageName1 = [NSString stringWithFormat:@"552cc3b5eed94_32"];
    UIImage *selectedImage1 = [[UIImage imageNamed:selectedImageName1]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:@"论坛" image:normalImage1 selectedImage:selectedImage1];
    ltv.tabBarItem = item1;
    UINavigationController *lt = [[UINavigationController alloc]initWithRootViewController:ltv];
    
    ZiXunViewController *zxv = [[ZiXunViewController alloc]init];
    NSString *normalImageName2 = [NSString stringWithFormat:@"552cc6fb156d2_32"];
    UIImage *normalImage2 = [[UIImage imageNamed:normalImageName2]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSString *selectedImageName2 = [NSString stringWithFormat:@"552cc6f91ea16_32"];
    UIImage *selectedImage2 = [[UIImage imageNamed:selectedImageName2]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item2 = [[UITabBarItem alloc]initWithTitle:@"资讯" image:normalImage2 selectedImage:selectedImage2];
    zxv.tabBarItem = item2;
    UINavigationController *zx = [[UINavigationController alloc]initWithRootViewController:zxv];
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = @[sy,lt,zx];
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
        return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
