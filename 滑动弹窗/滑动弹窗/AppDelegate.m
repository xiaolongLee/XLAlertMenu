//
//  AppDelegate.m
//  滑动弹窗
//
//  Created by 李小龙 on 2020/3/21.
//  Copyright © 2020 李小龙. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
       ViewController *root = [ViewController new];
       self.window.rootViewController = root;
       [self.window makeKeyAndVisible];
       return YES;
    return YES;
}


 


@end
