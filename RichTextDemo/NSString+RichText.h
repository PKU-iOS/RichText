//
//  NSString+Mobile.h
//  xyjmall
//
//  Created by mac on 15/7/15.
//  Copyright (c) 2015年 golvin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RichText)

//手机号码指定范围替换
- (NSString *) replaceCharactersAtRange:(NSRange) range withString:(NSString *)aString;

//字符串指定子串替换
- (NSArray *) rangeOfSuString:(NSString *) subString;

//将普通字符串转换为富文本字符串（设置指定子串的属性）(设置单个字符串的属性)
- (NSMutableAttributedString *) convertAttribute:(NSDictionary *) attributes withSubString:(NSString *)subString;

//将普通字符串转换为富文本字符串（设置指定子串的属性）(设置多个字符串的属性)
- (NSMutableAttributedString *) convertAttributes:(NSArray *) attributes withSubStrings:(NSArray *)subStrings;

@end
