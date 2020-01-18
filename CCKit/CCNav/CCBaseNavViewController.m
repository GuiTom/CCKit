//
//  CCBaseNavViewController.m
//  CCKit
//
//  Created by CC on 2020/1/16.
//  Copyright © 2020 CC. All rights reserved.
//

#import "CCBaseNavViewController.h"

@implementation CCBaseNavViewController
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if(self = [super initWithRootViewController:rootViewController]){
    }
    return self;
}
- (nullable NSArray<__kindof UIViewController *> *)popToViewControllerByClassName:(NSString*)className animated:(BOOL)animated{
    for (int i=0;i<self.viewControllers.count; i++) {
        UIViewController *vc = self.viewControllers[i];
        NSString *classStr = NSStringFromClass([vc class]);
        if([classStr isEqualToString:className]){
           return [self popToViewController:vc animated:animated];
        }
    }
    return nil;
}
@end
