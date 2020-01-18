//
//  CCBaseViewController.h
//  CCKit
//
//  Created by CC on 2020/1/16.
//  Copyright © 2020 CC. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CCBackType) {
    CCBackTypePre = 0,
    CCBackTypeDismiss = 1,
    CCBackTypeGlobalDefineByNavigation = 2,
    CCBackTypeDefineByPage = 3,
};
NS_ASSUME_NONNULL_BEGIN

@interface CCBaseViewController : UIViewController
-(void)fall_back;
-(void)completionBack;

@property(nonatomic,assign)CCBackType completionBackType;
@property(nonatomic,strong)NSString* completionBackClassName;
@property(nonatomic,assign)BOOL hideNavigationBarInPage;
@end

NS_ASSUME_NONNULL_END
