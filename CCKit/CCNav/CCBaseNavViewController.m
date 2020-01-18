//
//  CCBaseNavViewController.m
//  CCKit
//
//  Created by CC on 2020/1/16.
//  Copyright © 2020 CC. All rights reserved.
//

#import "CCBaseNavViewController.h"
@interface CCBaseNavViewController()
@end
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
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //注意navigationItem.backBarButtonItem和navigationItem.leftBarButtonItem的区别，前者是为下一个页面设置返回按钮，后者是为当前页面设置返回按钮
    if(self.backButtonResourceName){
        UIImage *btnImage = [[UIImage imageNamed:self.backButtonResourceName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithImage:btnImage style:UIBarButtonItemStylePlain target:viewController action:@selector(fall_back)];
        viewController.navigationItem.leftBarButtonItem = btnItem;
    }else {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:self.backButtonTitle style:UIBarButtonItemStylePlain target:nil action:nil];
        [self.viewControllers lastObject].navigationItem.backBarButtonItem = backItem;
    }
    if(self.backButtonColor){
        self.navigationBar.tintColor=self.backButtonColor;
    }
    if(self.titleColor){
        NSDictionary *dict = [NSDictionary dictionaryWithObject:self.titleColor forKey:NSForegroundColorAttributeName];
        self.navigationBar.titleTextAttributes = dict;
    }
    [super pushViewController:viewController animated:animated];
}
@end
