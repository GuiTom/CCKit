//
//  AlertSuccessWindow.m
//  廊坊直销银行
//
//  Created by CC on 2020/1/12.
//  Copyright © 2020 kakye. All rights reserved.
//

#import "AlertSuccessWindow.h"

@implementation AlertSuccessWindow
+(void)showAlertViewWithSuccessInfo:(NSString *)content confirm:(NSString*)confirm handle:(HandleBlock)handle{
    AlertSuccessWindow *window = [[AlertSuccessWindow alloc] initWithContent:content confirm:confirm handle:handle];
    window.handle = handle;
    [window showInWidow];
}
-(instancetype)initWithContent:(NSString *)content confirm:(NSString*)confirm handle:(HandleBlock)handle{
    if(self = [super init]){
        self.backgroundColor = [UIColor whiteColor];
        
        UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        CGFloat labelMarginLeft = 38;
        
        
        CGFloat imageTopmargin = 28;
        CGFloat imageWidth = 46.0f;
        CGFloat imageX = (kScreenWidth - marginLeft*2 - imageWidth)/2;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alertResult.bundle/成功"]];
        imageView.frame = CGRectMake(imageX, imageTopmargin, imageWidth, imageWidth);
        [self addSubview:imageView];
        CGFloat labelTopMargin = imageTopmargin + imageWidth + 10 ;
        CGFloat labelWidth = kScreenWidth - marginLeft*2 - labelMarginLeft*2;

        CGFloat labelHeight = 22.0f;
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelMarginLeft, labelTopMargin, labelWidth, labelHeight)];
        [self addSubview:contentLabel];
        contentLabel.font = font;
        contentLabel.textColor = UIColorFromRGBA(0x333333, 1);
        contentLabel.numberOfLines = 0;
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.text = content;
        CGFloat buttonTopMargin = 30;
        CGFloat buttonHeight = 51;
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, labelTopMargin+labelHeight+buttonTopMargin-1, kScreenWidth-marginLeft*2+1, 1)];
        [self addSubview:lineView];
        lineView.backgroundColor = UIColorFromRGBA(0xf0f0f0, 1);
    
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, labelTopMargin+labelHeight+buttonTopMargin, kScreenWidth-marginLeft*2, buttonHeight)];
        [button setTitleColor:UIColorFromRGBA(0x0068b6, 1) forState:UIControlStateNormal];
        [button setTitle:confirm forState:UIControlStateNormal];
        [button setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
        [self addSubview:button];
        [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
        
        self.contentHeight = labelTopMargin + labelHeight + buttonTopMargin + buttonHeight;

    }
    return self;
}

@end
