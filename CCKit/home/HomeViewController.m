//
//  HomeViewController.m
//  CCKit
//
//  Created by CC on 2020/1/16.
//  Copyright © 2020 CC. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeDataSource.h"
#import "CCBaseNavViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController5.h"
#import "ViewController6.h"
#import "SharedViewController.h"
#import "AlertWindow.h"
#import "AlertSuccessWindow.h"
#import "CelebrateWindow.h"
#import "ConfirmWindow.h"
#import "ImageViewWindow.h"
#import "SeletionActionSheet.h"

#import "UpdateConfirmWindow.h"
#import "UserAgrementWindow.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *table;

@end

@implementation HomeViewController
static NSString *cellId = @"cellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
   
    self.table.dataSource = self;
    self.table.delegate = self;
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    [self.view addSubview:self.table];
}
#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [HomeDataSource shareInstance].dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *cells = [[HomeDataSource shareInstance].dataSource objectAtIndex:section][@"cells"];
    
    return cells.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    NSDictionary *cellData = [HomeDataSource shareInstance].dataSource[indexPath.section][@"cells"][indexPath.row];
    cell.textLabel.text = cellData[@"title"];
    cell.textLabel.numberOfLines = 0;
    return cell;
}
#pragma mark UIScrollViewDelegate
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [UILabel new];
    NSString *headerTitle = [HomeDataSource shareInstance].dataSource[section][@"header"];
    label.text = headerTitle;
    return label;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        return 60.0f;
    }else {
        return 44.0f;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   NSDictionary *sectiondata = [HomeDataSource shareInstance].dataSource[indexPath.section];
   NSArray *cellDatas = sectiondata[@"cells"];
   NSDictionary *cellData = cellDatas[indexPath.row];
   NSString *title = cellData[@"title"];
   NSString *header = sectiondata[@"header"];
    if([header isEqualToString:@"视图跳转逻辑"]){
        if([title isEqualToString:@"完成任务时直接返回到上一个页面"]){
            ViewController1 *vc = [ViewController1 new];
            [self.navigationController pushViewController:vc animated:YES];
        }else  if([title isEqualToString:@"完成任务时返回到在进入本页面时指定的页面"]){
            ViewController2 *vc = [ViewController2 new];
            [self.navigationController pushViewController:vc animated:YES];
        }else  if([title isEqualToString:@"完成任务时返回到在进入前驱页面指定的页面(全局指定)"]){
            CCBaseNavViewController *navVC = (CCBaseNavViewController*)self.navigationController;
            navVC.globalCompletionBackClassName = NSStringFromClass([self class]);
            ViewController3 *vc = [ViewController3 new];
            navVC.globalCompletionBackClassName = @"HomeViewController";
            vc.completionBackType = CCBackTypePre;
            [self.navigationController pushViewController:vc animated:YES];
        }else  if([title isEqualToString:@"完成任务时直接返回到上一个页面（模态单页面）"]){
            SharedViewController *vc = [SharedViewController new];
            vc.completionBackType = CCBackTypeDismiss;
            [self presentViewController:vc animated:YES completion:nil];
        }else  if([title isEqualToString:@"完成任务时返回被模态之前的页面（模态页面栈）"]){
            ViewController5 *vc = [ViewController5 new];
            vc.completionBackType = CCBackTypeDismiss;
            CCBaseNavViewController *navVC = [[CCBaseNavViewController alloc] initWithRootViewController:vc];
            [self presentViewController:navVC animated:YES completion:nil];
        }else  if([title isEqualToString:@"每个页面单独设置导航栏"]){
            ViewController6 *vc = [ViewController6 new];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if([header isEqualToString:@"UI组件"]){
        if([title isEqualToString:@"Alert弹窗"]){
            [AlertWindow showAlertViewWithContent:title confirm:@"确定" handle:^(NSInteger buttonIndex) {
                
            }];
        }else  if([title isEqualToString:@"Confirm弹窗"]){
            [ConfirmWindow showConfirmViewWithContent:title confirm:@"确定" cancel:@"取消" handle:^(NSInteger buttonIndex) {
                
                
            }];
        }else  if([title isEqualToString:@"更新提示弹窗"]){
            [UpdateConfirmWindow showAlertViewWithContent:title subTitle:@"版本好5.0.7" content:@"这是更新提示更新提示更新提示更新提示更新提示跟同学提示" confirm:@"立即更新" skip:@"下次吧" handle:^(NSInteger buttonIndex) {
                
                
            }];
        }else  if([title isEqualToString:@"活动奖励弹窗"]){
            NSString *total = @"5000";
            NSDictionary *attrDict1 = @{NSFontAttributeName: [UIFont systemFontOfSize:30]};
            NSString *infoContent = [NSString stringWithFormat:@"恭喜您获得%@元新手大礼包",total];
            NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:infoContent];
            [text addAttributes:attrDict1 range:[[text string] rangeOfString:total]];
            
            [CelebrateWindow showAlertViewWithContent:text confirm:@"点击立即实名认证" handle:^(NSInteger buttonIndex) {
                    if(buttonIndex==0){
                        NSLog(@"您点击了立即领取按钮");
                   
                    }
            }];
        }else  if([title isEqualToString:@"展示成功弹窗"]){
            [AlertSuccessWindow showAlertViewWithSuccessInfo:@"成功啦" confirm:@"确定" handle:^(NSInteger buttonIndex) {
                
            }];
        }else if([title isEqualToString:@"用户隐私协议弹窗"]){
            NSString *content = @"感谢您使用廊坊银行直销银行。\n为了提供更好的服务，我行可能会对您的个人信息进行收集、使用、共享和保护。\n%@，并确认是否同意该协议。您需同意该隐私保护政策方可继续使用直销银行服务。";
            NSArray *protocols = @[
                @{
                    @"title":@"用户隐私协议",
                    @"content_path":@"https://m.baidu.com/"}
                ];
                UIViewController *topVC = self;
                    NSString *warningInfo = @"请您在使用直销银行服务前认真阅读";
                    UIView *containerView = topVC.view;
                    if(topVC.tabBarController){
                        containerView = topVC.tabBarController.view;
                    }
            [UserAgrementWindow showConfirmViewWithContent:content inView:containerView warningInfo:warningInfo protocols:protocols confirm:@"同意" cancel:@"暂不同意" handle:^(NSInteger buttonIndex) {
                                    if(buttonIndex==0){
                                        NSLog(@"您点击了取消按钮");
                                        exit(1);
                                    }else if(buttonIndex==1){
                                        NSLog(@"您点击了确认按钮");
                                       
                                    }
                    } handleClickUrl:^(NSString *url) {
                        NSLog(@"您点击了用户隐私协议链接:%@",url);
                    }];
        }
    }
    
}


@end
