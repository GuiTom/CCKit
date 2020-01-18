//
//  SharedViewController.m
//  CCKit
//
//  Created by CC on 2020/1/17.
//  Copyright © 2020 CC. All rights reserved.
//

#import "SharedViewController.h"

@interface SharedViewController ()
@property(nonatomic,strong)UIButton *completionButton;
@end

@implementation SharedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([self class]);
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    [self.view addSubview:titleLabel];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = self.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.completionButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 150, 30)];
    self.completionButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.completionButton];
    [self.completionButton setTitle:@"completionBack" forState:UIControlStateNormal];
    [self.completionButton addTarget:self action:@selector(completionBack) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 260, [UIScreen mainScreen].bounds.size.width-20*2, 64)];
    [self.view addSubview:tipLabel];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.numberOfLines = 0;
    tipLabel.textAlignment = NSTextAlignmentLeft;
    if(self.completionBackType == CCBackTypePre){
        tipLabel.text = @"completionBackType == CCBackTypePre,\n点击按钮返回上一页面";
    }else if(self.completionBackType==CCBackTypeDefineByPage){
        tipLabel.text = @"self.completionBackType==CCBackTypeDefineByPage,\n点击按钮返回本页面的completionBackClassName属性定义的页面";
    }else if(self.completionBackType == CCBackTypeGlobalDefineByNavigation){
        
        tipLabel.text = @"completionBackType == CCBackTypeGlobalDefineByNavigation,\n点击按钮返回navigationViewController的globalCompletionBackClassName属性定义的页面";
    }else if(self.completionBackType == CCBackTypeDismiss){
        if(self.navigationController){
            tipLabel.text = @"completionBackType == CCBackTypeDismiss,\n点击按钮后本页面连同所在页面栈一起被消失(dismiss)";
        }else {
            tipLabel.text = @"completionBackType == CCBackTypeDismiss,\n点击按钮后本页面直接消失(dismiss)";
        }
    }
    [tipLabel sizeToFit];
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
