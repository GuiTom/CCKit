//
//  AppDelegate.m
//  CCKit
//
//  Created by CC on 2020/1/16.
//  Copyright © 2020 CC. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "CCBaseNavViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary    *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CCBaseNavViewController *ccBaseNav = [[CCBaseNavViewController alloc] initWithRootViewController:[HomeViewController new]];
    self.window.rootViewController = ccBaseNav;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
