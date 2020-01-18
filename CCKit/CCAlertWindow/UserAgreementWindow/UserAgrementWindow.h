//
//  UserAgrementWindow.h
//  廊坊直销银行
//
//  Created by CC on 2020/1/11.
//  Copyright © 2020 kakye. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AlertWindow.h"
#define UIColorFromRGBA(rgbValue,a)  ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a])
typedef void(^HandleClickUrlBlock) (NSString *url);
NS_ASSUME_NONNULL_BEGIN

@interface UserAgrementWindow : AlertWindow
+(void)showConfirmViewWithContent:(NSString *)content inView:(UIView*)view warningInfo:(NSString*)warningInfo protocols:(NSArray*)protocols confirm:(NSString*)confirm cancel:(NSString*)cancel handle:(HandleBlock)handle handleClickUrl:(HandleClickUrlBlock)handleClickUrl;

@end

NS_ASSUME_NONNULL_END
