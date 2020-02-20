//
//  NSSring+Tool.h
//  廊坊直销银行
//
//  Created by kayak on 2019/12/18.
//  Copyright © 2019 CC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Tool)
-(NSString*)commaSplicedString;
-(BOOL)versionIsLagerThan:(NSString*)version;
-(BOOL)isPhoneNumber:(NSString*)mobilePhone;
-(BOOL)isPhoneNumber;
-(BOOL)isIDCode;
-(BOOL)isMailAddress;
@end

NS_ASSUME_NONNULL_END
