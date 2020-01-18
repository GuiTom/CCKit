//
//  CCBaseViewController.m
//  CCKit
//
//  Created by CC on 2020/1/16.
//  Copyright © 2020 CC. All rights reserved.
//

#import "CCBaseViewController.h"
#import "CCBaseNavViewController.h"

@interface CCBaseViewController ()

@end

@implementation CCBaseViewController
//-(instancetype)init{
//    if(self = [super init]){
//        self.modalPresentationStyle = UIModalPresentationFullScreen;
//    }
//    return self;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.hideNavigationBarInPage];
}
-(void)fall_back{
    if(self.completionBackType == CCBackTypeDismiss){//如果当前是在模态视图
        if(self.navigationController){//如果是模态视图包装着导页面栈的情况
            if([self.navigationController.viewControllers firstObject] == self){
                 [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            }else {
                [self.navigationController popViewControllerAnimated:YES];
            }
           
        }else {//如果是单页的模态视图
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)completionBack{
    if(self.completionBackType == CCBackTypePre){//为K_PRE_ONE或为空，pop到上一页面
        [self.navigationController popViewControllerAnimated:YES];
    }else if(self.completionBackType == CCBackTypeDismiss){// 直接dismiss
        //让self从模态视图消失，不论本viewColler(即self)被在一个UINavigationController的页面栈里面，还是不在页面栈里面
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if(self.completionBackType == CCBackTypeDefineByPage){//为所要跳转到的控制器的类的名称字符串
        NSAssert(self.completionBackClassName,@"请为视图控制器赋值completionBackClassName属性");
        if(self.completionBackClassName){
            [((CCBaseNavViewController*)self.navigationController) popToViewControllerByClassName:self.completionBackClassName animated:YES];
        }
    }else if(self.completionBackType == CCBackTypeGlobalDefineByNavigation) {//为所要跳转到的控制器的类的名称字符串
        CCBaseNavViewController *navVC = (CCBaseNavViewController*)self.navigationController;
        NSAssert(navVC.globalCompletionBackClassName,@"请为导航控制器赋值globalCompletionBackClassName属性");
        if(navVC.globalCompletionBackClassName){
            [navVC popToViewControllerByClassName:navVC.globalCompletionBackClassName animated:YES];
        }
    }else {
        NSAssert(1, @"completionBackType定义错误");
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
