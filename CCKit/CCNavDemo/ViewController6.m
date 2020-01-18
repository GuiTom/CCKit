//
//  ViewController6.m
//  CCKit
//
//  Created by CC on 2020/1/17.
//  Copyright © 2020 CC. All rights reserved.
//

#import "ViewController6.h"
#import "ViewController6_2.h"
@interface ViewController6 ()

@property(nonatomic,strong)UIButton *nextButton;
@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"视图6-1";
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.nextButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 150, 30)];
    [self.view addSubview:self.nextButton];
    self.nextButton.backgroundColor = [UIColor blueColor];
    [self.nextButton setTitle:@"下一页" forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(toNext:) forControlEvents:UIControlEventTouchUpInside];
        
}
-(void)toNext:(UIButton*)sender{
    ViewController6_2*vc = [ViewController6_2 new];
    vc.hideNavigationBarInPage = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
