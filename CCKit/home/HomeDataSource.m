
//
//  HomeDataSource.m
//  CCKit
//
//  Created by CC on 2020/1/16.
//  Copyright © 2020 CC. All rights reserved.
//

#import "HomeDataSource.h"
@interface HomeDataSource()

@end
@implementation HomeDataSource
+(instancetype)shareInstance{
    static HomeDataSource * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HomeDataSource alloc] init];
    });
    return instance;
}
-(instancetype)init{
    if(self = [super init]){
        [self initDataSource];
    }
    return self;
}
-(void)initDataSource{
    if(!_dataSource){
        _dataSource = @[
            @{
                @"header":@"视图跳转逻辑",
                @"cells":@[
                        @{@"title":@"完成任务时直接返回到上一个页面"},
                        @{@"title":@"完成任务时返回到在进入本页面时指定的页面"},
                        @{@"title":@"完成任务时返回到在进入前驱页面指定的页面(全局指定)"},
                        @{@"title":@"完成任务时直接返回到上一个页面（模态单页面）"},
                        @{@"title":@"完成任务时返回被模态之前的页面（模态页面栈）"},
                        @{@"title":@"每个页面单独设置导航栏"},
                        
                ]
            },
            @{
                @"header":@"UI组件",
                @"cells":@[
                        @{@"title":@"Alert弹窗"},
                        @{@"title":@"Confirm弹窗"},
                        @{@"title":@"更新提示弹窗"},
                        @{@"title":@"活动奖励弹窗"},
                        @{@"title":@"展示成功弹窗"},
                        @{@"title":@"用户隐私协议弹窗"},
                ]
            }
        ].mutableCopy;
    }
}
@end
