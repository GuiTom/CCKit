//
//  ConfirmWindow.m
//  廊坊直销银行
//
//  Created by CC on 2019/12/20.
//  Copyright © 2019 kakye. All rights reserved.
//

#import "ConfirmWindow.h"

@implementation ConfirmWindow
+(void)showConfirmViewWithContent:(NSString *)content confirm:(NSString*)confirm cancel:(NSString*)cancel handle:(HandleBlock)handle{
    ConfirmWindow *window = [[ConfirmWindow alloc] initWithContent:content confirm:confirm cancel:cancel handle:handle];
    window.handle = handle;
    [window showInWidow];
}
-(instancetype)initWithContent:(NSString *)content confirm:(NSString*)confirm cancel:(NSString*)cancel handle:(HandleBlock)handle{
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
        contentLabel.textColor = UIColorFromRGBA(0x333333,1);
        contentLabel.numberOfLines = 0;
        contentLabel.text = content;
        contentLabel.textAlignment = NSTextAlignmentCenter;
        CGFloat buttonTopMargin = 30;
        CGFloat buttonHeight = 51;
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, labelTopMargin+size.height+buttonTopMargin-1, kScreenWidth-marginLeft*2+1, 1)];
        [self addSubview:lineView];
        lineView.backgroundColor = UIColorFromRGBA(0xF0F0F0,1);
        CGFloat buttonWidth = (kScreenWidth-marginLeft*2)/2;
        
        for (int i=0; i<2; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth*i, labelTopMargin+size.height+buttonTopMargin, buttonWidth, buttonHeight)];
            
            if(i==0){
                [button setTitleColor:UIColorFromRGBA(0x999999,1) forState:UIControlStateNormal];
                [button setTitle:cancel forState:UIControlStateNormal];
            }else {
                [button setTitleColor:UIColorFromRGBA(0x0068B6,1) forState:UIControlStateNormal];
                [button setTitle:confirm forState:UIControlStateNormal];
            }
            [button setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];

            [self addSubview:button];
            button.tag = i;
            [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
            
            self.contentHeight = labelTopMargin + size.height + buttonTopMargin + buttonHeight;
        }
        UIView *middleLine = [[UIView alloc] initWithFrame:CGRectMake(buttonWidth,labelTopMargin+size.height+buttonTopMargin, 1, buttonHeight)];
        [self addSubview:middleLine];
        middleLine.backgroundColor = UIColorFromRGBA(0xF0F0F0,1);

    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
