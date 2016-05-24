//
//  AppDelegate.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/23.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "MainViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark 集成左右侧滑的案例

//https://github.com/gotosleep/JASidePanels

-(void)initSidePlane{
    
    //初始化框架
    JASidePanelController *jsVC = [[JASidePanelController alloc] init];
    jsVC.shouldDelegateAutorotateToVisiblePanel = NO;  //这个啥作用，暂时不清楚
    
    //左视图间距
    jsVC.leftGapPercentage = 0.8;   //左边的viewcontroller显示的宽度
    jsVC.bounceOnSidePanelClose = NO;  //当关闭侧边栏的时候不反弹
    jsVC.maximumAnimationDuration = 0;  //最大的反弹动画范围
    
    //右视图间距
    jsVC.rightGapPercentage = 0.3;   //左边的viewcontroller显示的宽度
    
    
    //左边控制器
    LeftViewController *leftVc=[[LeftViewController alloc] init];
    jsVC.leftPanel = leftVc;  //添加左边的viewcontroller
    leftVc.JASidePanalCtrl=jsVC;
    
    
    
    
    
    //中间
    MainViewController *mainCtrl = [[MainViewController  alloc] init];
    JSNavigationController *nav=[[JSNavigationController alloc] initWithRootViewController:mainCtrl];
    jsVC.centerPanel = nav;  //添加中间的viewcontroller
  
    
    
    
    //右边控制器
    RightViewController *rightVc=[[RightViewController alloc] init];
    jsVC.rightPanel=rightVc;//添加右边的viewcontroller
    rightVc.JASidePanalCtrl=jsVC;
    

    
    [self.window setRootViewController:jsVC];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initSidePlane];
    // Override point for customization after application launch.
    [JSNavigationController initialize];
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
