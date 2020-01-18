//
//  ShareSelectionWindow.m
//  廊坊直销银行
//
//  Created by CC on 2020/1/8.
//  Copyright © 2020 kakye. All rights reserved.
//

#import "ShareSelectionWindow.h"
@interface ShareSelectionWindow()
@property(nonatomic,copy)HandleBlock handle;
@end

@implementation ShareSelectionWindow
+(void)showShareSelectionWindow:(NSString*)cancelTitle handle:(HandleBlock)handle{
    ShareSelectionWindow *shareSelectionWindow = [[ShareSelectionWindow alloc] initWithCancalTitle:cancelTitle];
    shareSelectionWindow.handle = handle;
    [shareSelectionWindow showInWidow];
}
-(instancetype)initWithCancalTitle:(NSString*)cancalTitle{
    if(self = [super init]){
        self.contentHeight = 167.0f;
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 118.3f)];
        [self addSubview:containerView];
        containerView.layer.cornerRadius = 8;
        containerView.layer.masksToBounds = YES;
        containerView.backgroundColor = UIColorFromRGBA(0xf5f5f5, 1);
//        containerView.backgroundColor = [UIColor blueColor];
        NSArray *nameArray = @[@"微信好友",@"朋友圈",@"QQ好友",@"QQ空间"];
        NSArray *buttonRes = @[@"分享-微信",@"分享-朋友圈",@"分享-QQ",@"分享-QQ空间"];
        for (int i=0; i<buttonRes.count; i++) {
            CGFloat buttonGap = (kScreenWidth -34*2 - 50*buttonRes.count)/(buttonRes.count-1);
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*(50+buttonGap)+34, 22, 50, 50)];
            [button setImage:[UIImage imageNamed:buttonRes[i]] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = i+1;
//            button.backgroundColor = [UIColor redColor];
            
            [containerView addSubview:button];
            CGFloat buttonCentX = i*(50+buttonGap)+34+50/2;
            CGFloat labelWidth = 60;
            CGFloat labelX = buttonCentX - labelWidth/2;
            UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, 78, labelWidth, 20)];
            nameLabel.textAlignment = NSTextAlignmentCenter;
            nameLabel.text = nameArray[i];
            nameLabel.tag = i+ 1;
            nameLabel.userInteractionEnabled = YES;
            nameLabel.textColor = UIColorFromRGBA(0x333333,1);
            nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
            UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickButton:)];
            [nameLabel addGestureRecognizer:tapGes];
            [containerView addSubview:nameLabel];
        }
        UIButton *canCalButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 118, kScreenWidth,49)];
        [self addSubview:canCalButton];
        [canCalButton setTitle:cancalTitle forState:UIControlStateNormal];
        [canCalButton setTitleColor:UIColorFromRGBA(0x666666,1) forState:UIControlStateNormal];
        [canCalButton setFont:[UIFont systemFontOfSize:14]];
        canCalButton.tag = 0;

        [canCalButton addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
  
        
    }
    return self;
}
-(void)onClickButton:(id)sender{
    [self dismiss];
     if(self.handle){
        NSInteger index = 0;
        if([sender isMemberOfClass:[UIButton class]]){
            index = ((UIButton *)sender).tag;
        }else {
            index = ((UITapGestureRecognizer *)sender).view.tag;
        }
        self.handle(index);
     }
    
    
}
-(void)dismiss{
    if(self.superview){
        [self removeFromSuperview];
    }
    if(self.maskView.superview){
        [self.maskView removeFromSuperview];
    }
}
-(void)showInWidow{
    [self.layer masksToBounds];
    self.backgroundColor = [UIColor whiteColor];

    CGFloat marginTop = kScreenHeight - self.contentHeight;
    
    self.layer.cornerRadius = 8;
    
    self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.maskView.backgroundColor = UIColorFromRGBA(0x000000,0.5f);
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self.maskView addGestureRecognizer:tapGes];
    [[UIApplication sharedApplication].keyWindow addSubview:self.maskView];
    self.frame = CGRectMake(0, kScreenHeight, kScreenWidth, self.contentHeight);
    [self.maskView addSubview:self];
    [UIView animateWithDuration:0.3f animations:^{
        
        self.frame = CGRectMake(0, marginTop, kScreenWidth, self.contentHeight);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
