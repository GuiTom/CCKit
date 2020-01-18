//
//  AlertWindow.h
//  廊坊直销银行
//
//  Created by CC on 2019/12/20.
//  Copyright © 2019 kakye. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HandleBlock) (NSInteger buttonIndex);
#define marginLeft 38
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define UIColorFromRGBA(rgbValue,a)  ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a])
NS_ASSUME_NONNULL_BEGIN
@interface AlertWindow : UIView
@property(nonatomic,assign)CGFloat contentHeight;
@property(nonatomic,copy)HandleBlock handle;
+(void)showAlertViewWithContent:(NSString *)content confirm:(NSString*)confirm handle:(HandleBlock)handle;
-(instancetype)initWithContent:(NSString *)content confirm:(NSString*)confirm handle:(HandleBlock)handle;
-(void)onClickButton:(UIButton*)sender;
-(void)showInWidow;
@end

NS_ASSUME_NONNULL_END
