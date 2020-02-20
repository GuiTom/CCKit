//
//  NSSring+Tool.m
//  廊坊直销银行
//
//  Created by kayak on 2019/12/18.
//  Copyright © 2019 CC. All rights reserved.
//

#import "NSString+Tool.h"

@implementation NSString (Tool)
-(NSString*)commaSplicedString{

    NSString *integerPart = self;
    NSString *floatPart = nil;
    if([self containsString:@"."]){
        NSArray *parts = [self componentsSeparatedByString:@"."];
        integerPart = [parts firstObject];
        floatPart = [parts lastObject];
    }
    NSMutableString *mutableStr = [[NSMutableString alloc] init];
    if(integerPart.length>3){
    NSInteger startIndex = integerPart.length%3;
   
    [mutableStr appendString:[integerPart substringToIndex:startIndex]];
    
    for (NSInteger i = startIndex;i<=integerPart.length-3;i+=3)
    {
        NSRange range = NSMakeRange(i, 3);
        if(startIndex>0){
            [mutableStr appendString:[NSString stringWithFormat:@",%@",[integerPart substringWithRange:range]]];
        }else {
            [mutableStr appendString:[NSString stringWithFormat:@"%@",[integerPart substringWithRange:range]]];
        }
    }
    }else {
        [mutableStr appendString:integerPart];
    }
    if(floatPart){
        [mutableStr appendString:@"."];
        [mutableStr appendString:floatPart];
    }
    return mutableStr.copy;
}
-(BOOL)versionIsLagerThan:(NSString*)version{
    NSArray *arr1 = [self componentsSeparatedByString:@"."];
    NSArray *arr2 = [version componentsSeparatedByString:@"."];
    NSInteger maxLength =MAX(arr1.count, arr2.count);
    for (int i=0; i<arr1.count; i++) {
        if(arr1.count<i+1){//我没别人长
            return  NO;
        }
        if(arr2.count<i+1){//别人没我长
            return YES;
        }
        NSInteger selfValue = [arr1[i] integerValue];
        NSInteger otherValue = [arr2[i] integerValue];
        if(selfValue<otherValue){
            return NO;
        }else if(selfValue>otherValue){
            return YES;
        }else {//相等
            
        }
    }
    return NO;
  
}
-(BOOL)isPhoneNumber{
    // 需要验证的字符串
//    NSString *mobilePhone = @"13227008888";
    // 编写正则表达式，验证mobilePhone是否为手机号码
    NSString *regex = @"^1[0-9]{10}$";
    // 创建谓词对象并设定条件表达式
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    // 字符串判断，然后BOOL值
    BOOL result = [predicate evaluateWithObject:self];
    return result;
}
-(BOOL)isIDCode{
    NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL result = [pre evaluateWithObject:self];//此处返回的是BOOL类型,YES or NO;
    return result;
}
-(BOOL)isMailAddress{
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
  return [pre evaluateWithObject:self];//此处返回的是BOOL类型,YES or NO;
}
@end
