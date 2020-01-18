//
//  CelebrateWindow.m
//  廊坊直销银行
//
//  Created by CC on 2019/12/20.
//  Copyright © 2019 kakye. All rights reserved.
//

#import "ImageViewWindow.h"

@interface ImageViewWindow ()
@property(nonatomic,copy)NSString *url;
@end
@implementation ImageViewWindow
+(void)showAlertViewWithImageUrl:(NSString*)imageUrl handle:(HandleBlock)handle{
    ImageViewWindow *celeWindow = [[ImageViewWindow alloc] init];
    celeWindow.handle = handle;
    celeWindow.url = imageUrl;
    [celeWindow showInWidow];
}


-(void)showInWidow{
      self.frame = CGRectMake(0, 0,kScreenWidth,kScreenHeight);
    UIImageView *bgIamgeView = [[UIImageView alloc] init];
    [self addSubview:bgIamgeView];
    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:self.url]];
    UIImage*image = [UIImage imageWithData:data];
    bgIamgeView.image = image;
    bgIamgeView.frame = CGRectMake((kScreenWidth-image.size.width)/2, (kScreenHeight-image.size.height)/2, image.size.width, bgIamgeView.image.size.height);
    self.backgroundColor = UIColorFromRGBA(0x000000,0.5f);
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    CGFloat closeButtonWidth = 24.0f;
    CGFloat closeButtonTopGap = 26.0f;
    UIButton *closeButton  = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth-closeButtonWidth)/2, bgIamgeView.frame.origin.y+bgIamgeView.frame.size.height+closeButtonTopGap, closeButtonWidth, closeButtonWidth)];
    [self addSubview:closeButton];
    [closeButton setImage:[UIImage imageNamed:@"imageViewWindow.bundle/close"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(onClickCloseButton) forControlEvents:UIControlEventTouchUpInside];

    UITapGestureRecognizer *tagGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBgImage:)];
    bgIamgeView.userInteractionEnabled = YES;
    [bgIamgeView addGestureRecognizer:tagGes];

    
}
-(void)onClickBgImage:(UITapGestureRecognizer*)tapGes{
    if(self.superview){
        [self removeFromSuperview];
    }
    if(self.handle){
        self.handle(0);
    }
}
-(void)onClickCloseButton{
    if(self.superview){
        [self removeFromSuperview];
    }
    if(self.handle){
        self.handle(-1);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
