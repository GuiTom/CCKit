//
//  SeletionActionSheet.m
//  廊坊直销银行
//
//  Created by CC on 2019/12/20.
//  Copyright © 2019 kakye. All rights reserved.
//

#import "SeletionActionSheet.h"
@interface SeletionActionSheet()
@property(nonatomic,strong)UIView *maskView;
@end
@implementation SeletionActionSheet
+(void)showActionSheetWithButtonTitles:(NSArray *)titles cancal:(NSString*)cancal handle:(HandleBlock)handle{
    SeletionActionSheet *selectionSheet = [[SeletionActionSheet alloc] initWithButtonTitles:titles cancel:cancal handle:handle];
    [selectionSheet showInWidow];
}
-(instancetype)initWithButtonTitles:(NSArray *)titles cancel:(NSString*)cancel handle:(HandleBlock)handle{
    if(self = [super init]){
        self.handle = handle;
        self.backgroundColor = [UIColor whiteColor];
        self.contentHeight = 50*titles.count+10+50;
        CGFloat marginTop = 0;
        for (int i=0; i<titles.count; i++) {
            UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, marginTop+50*i, kScreenWidth, 50)];
            [self addSubview:button];
            [button setFont:[UIFont fontWithName:@"PingFangSC-Medium" size:16]];
            if(i<titles.count-1){
            UIView *gapView = [[UIView alloc] initWithFrame:CGRectMake(0,50*(i+1), kScreenWidth, 1)];
             [self addSubview:gapView];
                gapView.backgroundColor = UIColorFromRGBA(0xF5F5F5,1);

            [self addSubview:gapView];
            }
            button.tag = i;
             [button setTitleColor:UIColorFromRGBA(0x0068B6,1) forState:UIControlStateNormal];
            
            [button setTitle:titles[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
        }
        UIView *gapView = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentHeight-50-10, kScreenWidth, 10)];
        [self addSubview:gapView];
        gapView.backgroundColor = UIColorFromRGBA(0xF5F5F5,1);
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, self.contentHeight-50, kScreenWidth, 50)];
        [button setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
        [self addSubview:button];
        button.tag = -1;
//        button.backgroundColor = [UIColor redColor];
        [button setTitleColor:UIColorFromRGBA(0x0068B6,1) forState:UIControlStateNormal];
        [button setTitle:cancel forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
  
           
    }
    return self;
}
-(void)onClickButton:(UIButton*)sender{
    [self dismiss];
    if(self.handle){
        self.handle(sender.tag);
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
    
    self.layer.cornerRadius = 6;
    
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
