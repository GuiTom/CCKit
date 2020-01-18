//
//  UpdateConfirmWindow.h
//  廊坊直销银行
//
//  Created by CC on 2019/12/20.
//  Copyright © 2019 kakye. All rights reserved.
//

#import "AlertWindow.h"
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define UIColorFromRGBA(rgbValue,a)  ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a])
NS_ASSUME_NONNULL_BEGIN

@interface UpdateConfirmWindow : AlertWindow
+(void)showAlertViewWithContent:(NSString *)title subTitle:(NSString*)subTitle content:(NSString*)content confirm:(NSString*)confirm skip:(NSString*)skip handle:(HandleBlock)handle;

@end

NS_ASSUME_NONNULL_END
