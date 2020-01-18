
//
//  UpdateConfirmWindow.m
//  廊坊直销银行
//
//  Created by CC on 2019/12/20.
//  Copyright © 2019 kakye. All rights reserved.
//

#import "UpdateConfirmWindow.h"

@implementation UpdateConfirmWindow
+(void)showAlertViewWithContent:(NSString *)title subTitle:(NSString*)subTitle content:(NSString*)content confirm:(NSString*)confirm skip:(NSString*)skip handle:(HandleBlock)handle{
    UpdateConfirmWindow *updateConfirmWindow = [[UpdateConfirmWindow alloc] initWithContent:title subTitle:subTitle content:content confirm:confirm skip:skip];
    updateConfirmWindow.handle = handle;
    [updateConfirmWindow showInWidow];
}
-(instancetype)initWithContent:(NSString *)title subTitle:(NSString*)subTitle content:(NSString*)content confirm:(NSString*)confirm skip:(NSString*)skip{
    if(self=[super init]){
        self.contentHeight = 375;
        self.backgroundColor = [UIColor whiteColor];
        CGFloat topBgHeight = 64;
        CGFloat topIconHeight = 88;
        CGFloat topIconWidth = 105;
        CGFloat topIconY = -23;
        UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-2*marginLeft, topBgHeight)];
        [self addSubview:bgImageView];
        [bgImageView setImage:[UIImage imageNamed:@"update_window.bundle/window_header"]];
         
        UIImageView *logImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-2*marginLeft-topIconWidth)/2, topIconY, topIconWidth, topIconHeight)];
        [logImageView setImage:[UIImage imageNamed:@"update_window.bundle/logo"]];
        [self addSubview:logImageView];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 73, kScreenWidth-2*58, 22)];
        [self addSubview:titleLabel];
        titleLabel.text = title;
//        titleLabel.backgroundColor = [UIColor redColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
        titleLabel.textColor = UIColorFromRGBA(0x333333, 1);
        UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 99, kScreenWidth-2*58, 17)];
        [self addSubview:subTitleLabel];
        subTitleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        subTitleLabel.textColor = UIColorFromRGBA(0x999999, 1);
        subTitleLabel.text = subTitle;
        subTitleLabel.textAlignment = NSTextAlignmentCenter;
//        subTitleLabel.backgroundColor = [UIColor greenColor];
        UITextView *contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 128, kScreenWidth-2*58, 200)];
        contentTextView.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        contentTextView.textColor = UIColorFromRGBA(0x333333, 1);
        contentTextView.text = content;
        contentTextView.editable = NO;
        contentTextView.textContainer.lineFragmentPadding = 0.0;
//        contentTextView.backgroundColor = [UIColor redColor];
        [self addSubview:contentTextView];
        CGFloat leftMargin = 38;
        UIImageView *halfAphpaMask = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"update_window.bundle/white_mask"]];
        halfAphpaMask.frame = CGRectMake(0, self.contentHeight-136,kScreenWidth -2*leftMargin, 136);
        [self addSubview:halfAphpaMask];
        UIButton *confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(20,282+2, kScreenWidth-2*58,44)];
        confirmButton.backgroundColor = UIColorFromRGBA(0x0068B6,1);
        [confirmButton setTitle:confirm forState:UIControlStateNormal];
        confirmButton.layer.cornerRadius = 4;
        confirmButton.layer.masksToBounds = YES;
        confirmButton.tag = 1;
        [self addSubview:confirmButton];
        
        [confirmButton addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
        UIButton *skipButton = [[UIButton alloc] initWithFrame:CGRectMake(20,282+46, kScreenWidth-2*58,44)];

        [skipButton setTitle:skip forState:UIControlStateNormal];
        [skipButton setTitleColor:UIColorFromRGBA(0x666666, 1) forState:UIControlStateNormal];
        [skipButton addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
        skipButton.tag = 0;
        [self addSubview:skipButton];
        
    }
    return self;
}
-(void)showInWidow{
    CGFloat leftMargin = 38;
    self.frame = CGRectMake(leftMargin, (kScreenHeight - self.contentHeight)/2, kScreenWidth -2*leftMargin, self.contentHeight);
    self.layer.cornerRadius = 6;
    [self.layer masksToBounds];
    self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.maskView.backgroundColor = UIColorFromRGBA(0x000000,0.5f);
//    self.maskView.alpha = 0.5f;
    [[UIApplication sharedApplication].keyWindow addSubview:self.maskView];
    [self.maskView addSubview:self];
    
}

@end
