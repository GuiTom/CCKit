//
//  CCBaseNavViewController.h
//  CCKit
//
//  Created by CC on 2020/1/16.
//  Copyright © 2020 CC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCBaseNavViewController : UINavigationController
@property(nonatomic,strong)UIColor *titleColor;
///backButtonResourceName 与 (backButtonTitle&&backButtonColor) 二选一即可
@property(nonatomic,strong)NSString*backButtonResourceName;
@property(nonatomic,strong)UIColor *backButtonColor;
@property(nonatomic,strong)NSString *backButtonTitle;
@property(nonatomic,strong)NSString* globalCompletionBackClassName;
- (nullable NSArray<__kindof UIViewController *> *)popToViewControllerByClassName:(NSString*)className animated:(BOOL)animated;
@end

NS_ASSUME_NONNULL_END
