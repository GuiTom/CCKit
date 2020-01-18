//
//  AlertSuccessWindow.h
//  廊坊直销银行
//
//  Created by CC on 2020/1/12.
//  Copyright © 2020 kakye. All rights reserved.
//

#import "AlertWindow.h"
#define UIColorFromRGBA(rgbValue,a)  ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a])
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
NS_ASSUME_NONNULL_BEGIN

@interface AlertSuccessWindow : AlertWindow
+(void)showAlertViewWithSuccessInfo:(NSString *)content confirm:(NSString*)confirm handle:(HandleBlock)handle;
@end

NS_ASSUME_NONNULL_END
