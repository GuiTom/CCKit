//
//  UserAgrementWindow.m
//  廊坊直销银行
//
//  Created by CC on 2020/1/11.
//  Copyright © 2020 kakye. All rights reserved.
//

#import "UserAgrementWindow.h"

@interface UserAgrementWindow()<UITextViewDelegate>
@property(nonatomic,copy)HandleClickUrlBlock handleClickUrl;
@property(nonatomic,assign)CGFloat contentWidth;
@end
@implementation UserAgrementWindow
+(void)showConfirmViewWithContent:(NSAttributedString *)content view:(UIView*)view confirm:(NSString*)confirm cancel:(NSString*)cancel handle:(HandleBlock)handle handleClickUrl:(HandleClickUrlBlock)handleClickUrl{
    UserAgrementWindow *window = [[UserAgrementWindow alloc] initWithContent:content confirm:confirm cancel:cancel];
    window.handle = handle;
    window.handleClickUrl = handleClickUrl;
    [window showInView:view];
}
+(void)showConfirmViewWithContent:(NSString *)content inView:(UIView*)view warningInfo:(NSString*)warningInfo protocols:(NSArray*)protocols confirm:(NSString*)confirm cancel:(NSString*)cancel handle:(HandleBlock)handle handleClickUrl:(HandleClickUrlBlock)handleClickUrl{
    NSString *protocol_str = @"";
  for (int i=0; i<protocols.count; i++) {
       NSString *title = protocols[i][@"title"];
//       title = @"廊坊银行股份有限公司直销银行隐私信息保护政策";
       title = [NSString stringWithFormat:@"《%@》",title];
       protocol_str = [NSString stringWithFormat:@"%@%@",protocol_str,title];
   }
   NSString *warningInfo_protocol_str = [NSString stringWithFormat:@"%@%@",warningInfo,protocol_str];
    content = [NSString stringWithFormat:content,warningInfo_protocol_str];
   NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:content];
    for (int i=0; i<protocols.count; i++) {
        //设置链接文本
        NSString *title = protocols[i][@"title"];
//        title = @"廊坊银行股份有限公司直销银行隐私信息保护政策";
        title = [NSString stringWithFormat:@"《%@》",title];
        [attributedString addAttribute:NSLinkAttributeName
                                 value:protocols[i][@"content_path"]
                                 range:[[attributedString string] rangeOfString:title]];
    }

    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Regular" size:14] range:NSMakeRange(0,content.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:UIColorFromRGBA(0x151515, 1) range:[[attributedString string] rangeOfString:warningInfo]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Semibold" size:14] range:[[attributedString string] rangeOfString:warningInfo]];
    [self showConfirmViewWithContent:attributedString.copy view:view confirm:confirm cancel:cancel handle:handle handleClickUrl:handleClickUrl];
}
-(instancetype)initWithContent:(NSAttributedString *)content confirm:(NSString*)confirm cancel:(NSString*)cancel{
    if(self = [super init]){
        self.backgroundColor = [UIColor whiteColor];
        
        self.contentWidth = 299.0f;
        UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        CGFloat labelMarginLeft = 20;
        CGFloat labelTopMargin = 20;
        CGFloat labelWidth = self.contentWidth - labelMarginLeft*2;
        
        CGSize size = [content.string boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:font}
                                                  context:nil].size;
        UITextView *contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(labelMarginLeft, labelTopMargin, labelWidth, size.height)];
        [self addSubview:contentTextView];
//        contentTextView.backgroundColor = [UIColor redColor];
        contentTextView.font = font;
        contentTextView.textColor = [UIColor colorWithRed:0x33 green:0x33 blue:0x33 alpha:1];

        contentTextView.textAlignment = NSTextAlignmentLeft;
        contentTextView.delegate = self;
        contentTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
        contentTextView.textContainer.lineFragmentPadding = 0.0;
        contentTextView.allowsEditingTextAttributes = NO;
        contentTextView.editable = NO;
        contentTextView.attributedText = content;

        [contentTextView sizeToFit];
        
        CGFloat buttonTopMargin = 40+contentTextView.frame.size.height+labelTopMargin;
        CGFloat buttonHeight = 44;
        
        CGFloat buttonGap = 11.0f;
        CGFloat marginToSuperView = 20.0f;
        CGFloat buttonWidth = (self.contentWidth-(marginToSuperView)*2-buttonGap)/2;
        
        for (int i=0; i<2; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((buttonWidth+buttonGap)*i+marginToSuperView,buttonTopMargin, buttonWidth, buttonHeight)];
            
            if(i==0){
                [button setTitleColor:UIColorFromRGBA(0x999999, 1) forState:UIControlStateNormal];
                [button setTitle:cancel forState:UIControlStateNormal];
            }else {
                [button setTitleColor:UIColorFromRGBA(0x0068b6, 1) forState:UIControlStateNormal];
                [button setTitle:confirm forState:UIControlStateNormal];
            }
            [button setFont:[UIFont fontWithName:@"PingFangSC-Medium" size:16]];

            [self addSubview:button];
            button.tag = i;
            if(i==0){
                button.backgroundColor = UIColorFromRGBA(0xebebeb, 1);
                [button setTitleColor:UIColorFromRGBA(0x666666,1) forState:UIControlStateNormal];
            }else {
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                button.backgroundColor = UIColorFromRGBA(0x0068B6,1);
            }
            button.layer.cornerRadius = 4.0;
            button.layer.masksToBounds = YES;
            
            [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
            CGFloat buttonBottomMargin = 20.0f;
            self.contentHeight = buttonTopMargin + buttonHeight+buttonBottomMargin;
        }
    

    }
    return self;
}
#pragma mark - 实现链接代理
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@"可以判断一下链接, %@",URL);
//    [self dismiss];
    if(self.handleClickUrl){
        self.handleClickUrl(URL.absoluteString);
    }
    return NO;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    NSLog(@"iOS 10+ %@",URL);
//    [self dismiss];
    if(self.handleClickUrl){
        self.handleClickUrl(URL.absoluteString);
    }
    return NO;
}
-(void)dismiss{
    if(self.superview){
        [self removeFromSuperview];
    }
    if(self.maskView.superview){
        [self.maskView removeFromSuperview];
    }
}
-(void)showInView:(UIView*)view{
    CGFloat leftMargin = (kScreenWidth-self.contentWidth)/2;
    self.frame = CGRectMake(leftMargin, (kScreenHeight - self.contentHeight)/2, self.contentWidth, self.contentHeight);
    self.layer.cornerRadius = 6;
    [self.layer masksToBounds];
    self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.maskView.backgroundColor = UIColorFromRGBA(0x000000,0.5f);

    [view addSubview:self.maskView];
    [self.maskView addSubview:self];
    
}

@end
