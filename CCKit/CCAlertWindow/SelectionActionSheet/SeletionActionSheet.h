//
//  SeletionActionSheet.h
//  廊坊直销银行
//
//  Created by CC on 2019/12/20.
//  Copyright © 2019 kakye. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define UIColorFromRGBA(rgbValue,a)  ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a])
typedef void(^HandleBlock) (NSInteger buttonIndex);
NS_ASSUME_NONNULL_BEGIN

@interface SeletionActionSheet : UIView

@property(nonatomic,assign)CGFloat contentHeight;
@property(nonatomic,copy)HandleBlock handle;
+(void)showActionSheetWithButtonTitles:(NSArray *)titles cancal:(NSString*)cancal handle:(HandleBlock)handle;
@end

NS_ASSUME_NONNULL_END
