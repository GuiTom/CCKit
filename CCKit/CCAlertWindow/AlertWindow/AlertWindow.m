//
//  AlertWindow.m
//  廊坊直销银行
//
//  Created by CC on 2019/12/20.
//  Copyright © 2019 kakye. All rights reserved.
//

#import "AlertWindow.h"


@interface AlertWindow ()
//@property(nonatomic,strong)NSString *content;
//@property(nonatomic,strong)NSString *confirm;
@property(nonatomic,strong)UIView *maskView;



@end
@implementation AlertWindow

+(void)showAlertViewWithContent:(NSString *)content confirm:(NSString*)confirm handle:(HandleBlock)handle{
    AlertWindow *window = [[AlertWindow alloc] initWithContent:content confirm:confirm handle:handle];
    window.handle = handle;
    [window showInWidow];
}
-(instancetype)initWithContent:(NSString *)content confirm:(NSString*)confirm handle:(HandleBlock)handle{
    if(self = [super init]){
        self.backgroundColor = [UIColor whiteColor];
        
        UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        CGFloat labelMarginLeft = 38;
        CGFloat labelTopMargin = 36;
        CGFloat labelWidth = kScreenWidth - marginLeft*2 - labelMarginLeft*2+1;
        
        CGSize size = [content boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:font}
                                                  context:nil].size;
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelMarginLeft, labelTopMargin, labelWidth, size.height)];
        [self addSubview:contentLabel];
        contentLabel.font = font;
        contentLabel.textColor = UIColorFromRGBA(0x333333, 1);
        contentLabel.numberOfLines = 0;
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.text = content;
        
        CGFloat buttonTopMargin = 30;
        CGFloat buttonHeight = 51;
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, labelTopMargin+size.height+buttonTopMargin-1, kScreenWidth-marginLeft*2+1, 1)];
        [self addSubview:lineView];
        lineView.backgroundColor = UIColorFromRGBA(0xf0f0f0, 1);
    
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, labelTopMargin+size.height+buttonTopMargin, kScreenWidth-marginLeft*2, buttonHeight)];
        [button setTitleColor:UIColorFromRGBA(0x006b86, 1) forState:UIControlStateNormal];
        [button setTitle:confirm forState:UIControlStateNormal];
        [button setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];

        [self addSubview:button];
        [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
        
        self.contentHeight = labelTopMargin + size.height + buttonTopMargin + buttonHeight;

    }
    return self;
}

-(void)onClickButton:(UIButton*)sender{
    if(self.superview){
        [self removeFromSuperview];
    }
    if(self.maskView.superview){
        [self.maskView removeFromSuperview];
    }
    if(self.handle){
        self.handle(sender.tag);
    }
}

-(void)showInWidow{
    CGFloat leftMargin = 38;
    self.frame = CGRectMake(leftMargin, (kScreenHeight - self.contentHeight)/2, kScreenWidth -2*leftMargin, self.contentHeight);
    self.layer.cornerRadius = 6;
    [self.layer masksToBounds];
    self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.maskView.backgroundColor = UIColorFromRGBA(0x000000, 0.5f);
    [[UIApplication sharedApplication].keyWindow addSubview:self.maskView];
    [self.maskView addSubview:self];
}

@end
