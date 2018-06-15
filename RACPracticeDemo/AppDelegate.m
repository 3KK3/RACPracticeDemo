//
//  AppDelegate.m
//  RACPracticeDemo
//
//  Created by YZY on 2018/6/14.
//  Copyright © 2018年 ZMJ. All rights reserved.
//

#import "AppDelegate.h"
#import "ZMJHomeViewController.h"
#import "ZMJHomeViewModel.h"
#import "ZMJServiceProtocolImpl.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 配置网络状态
    [self configurationNetWorkStatus];

    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];

    ZMJServiceProtocolImpl *serviceImpl = [[ZMJServiceProtocolImpl alloc] initServiceProtocolImpl];
    ZMJHomeViewModel *homVM = [[ZMJHomeViewModel alloc] initWithServiceImpl: serviceImpl params: nil];
    ZMJHomeViewController *homeVC = [[ZMJHomeViewController alloc] initWithViewModel: homVM];

    self.window.rootViewController = homeVC;
    [self.window makeKeyAndVisible];
    

    return YES;
}

- (void)configurationNetWorkStatus
{
    
    [GLobalRealReachability startNotifier];
    
    RAC(self, netWorkStatus) = [[[[[NSNotificationCenter defaultCenter]
                                   rac_addObserverForName:kRealReachabilityChangedNotification object:nil]
                                  map:^(NSNotification *notification) {
                                      return @([notification.object currentReachabilityStatus]);
                                  }]
                                 startWith:@([GLobalRealReachability currentReachabilityStatus])]
                                distinctUntilChanged];
    
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
