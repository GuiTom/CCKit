//
//  ViewController6_2.m
//  CCKit
//
//  Created by CC on 2020/1/17.
//  Copyright © 2020 CC. All rights reserved.
//

#import "ViewController6_2.h"
#import "ViewController6_3.h"
@interface ViewController6_2 ()
@property(nonatomic,strong)UIButton *preButton;
@property(nonatomic,strong)UIButton *nextButton;
@end

@implementation ViewController6_2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.preButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 150, 30)];
    [self.view addSubview:self.preButton];
    self.preButton.backgroundColor = [UIColor blueColor];
    [self.preButton setTitle:@"上一页" forState:UIControlStateNormal];
    [self.preButton addTarget:self action:@selector(fall_back) forControlEvents:UIControlEventTouchUpInside];
    self.nextButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 150, 30)];
    [self.view addSubview:self.nextButton];
    self.nextButton.backgroundColor = [UIColor blueColor];
    [self.nextButton setTitle:@"下一页" forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(toNext:) forControlEvents:UIControlEventTouchUpInside];
        
}
-(void)toNext:(UIButton*)sender{
    ViewController6_3*vc = [ViewController6_3 new];
  
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
