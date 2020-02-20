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
    /**全局设置返回键方法一
    ccBaseNav.backButtonColor = [UIColor greenColor];
    ccBaseNav.backButtonTitle = @"回家";
    */
    /**全局设置返回键方法二*/
    ccBaseNav.backButtonResourceName = @"backButtonResource.bundle/left_back";
    ccBaseNav.titleColor = [UIColor redColor];
    /**第三中方法 直接在ViewController类的viewDidLoad设置leftBarbuttonItem*/

    [self.window makeKeyAndVisible];
    return YES;
}


@end
