//
//  CelebrateWindow.m
//  廊坊直销银行
//
//  Created by CC on 2019/12/20.
//  Copyright © 2019 kakye. All rights reserved.
//

#import "CelebrateWindow.h"
@interface CelebrateWindow ()

@end
@implementation CelebrateWindow
+(void)showAlertViewWithContent:(NSAttributedString *)title confirm:(NSString*)confirm handle:(HandleBlock)handle{
    CelebrateWindow *celeWindow = [[CelebrateWindow alloc] initWithContent:title confirm:confirm];
    celeWindow.handle = handle;
    [celeWindow showInWidow];
}
-(instancetype)initWithContent:(NSAttributedString *)title confirm:(NSString*)confirm{
    if(self=[super init]){
        CGFloat bgY = -34.0f;
        CGFloat bgHeight = 352;
        CGFloat contentMarginLeft = 52;
        self.contentHeight = 318;
        UIImageView *bgIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0,bgY,kScreenWidth-2*contentMarginLeft, bgHeight)];
        [self addSubview:bgIamgeView];
        [bgIamgeView setImage:[UIImage imageNamed:@"CelebrateWindow.bundle/cele_bg"]];
        UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-52*2-13-14, -25, 14, 14)];
        [self addSubview:closeButton];
//        closeButton.backgroundColor =[UIColor blueColor];
        [closeButton setImage:[UIImage imageNamed:@"x"] forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
        closeButton.tag = -1;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, 45, kScreenWidth-52*2-34*2+10, 33)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        titleLabel.attributedText = title;
//        titleLabel.backgroundColor = [UIColor whiteColor];
        UIButton *confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(19, 249,kScreenWidth-72*2, 49)];
        [self addSubview:confirmButton];
        [confirmButton setBackgroundImage:[UIImage imageNamed:@"CelebrateWindow.bundle/bottom_button"] forState:UIControlStateNormal];
        [confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [confirmButton setFont:[UIFont fontWithName:@"PingFangSC-Medium" size:20]];
        [confirmButton setTitle:confirm forState:UIControlStateNormal];
        confirmButton.tag = 0;
        [confirmButton addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:titleLabel];
    }
    return self;
}
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL isIn = CGRectContainsPoint(CGRectMake(0, -55, self.bounds.size.width, self.bounds.size.height+25), point);
    return isIn;
}
-(void)showInWidow{
    CGFloat leftMargin = 52;
    self.frame = CGRectMake(leftMargin, (kScreenHeight - self.contentHeight)/2, kScreenWidth -2*leftMargin, self.contentHeight);
    self.layer.cornerRadius = 6;
    [self.layer masksToBounds];
    self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.maskView.backgroundColor = UIColorFromRGBA(0x000000, 0.5f);
//    self.maskView.alpha = 0.5f;
    [[UIApplication sharedApplication].keyWindow addSubview:self.maskView];
    [self.maskView addSubview:self];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
