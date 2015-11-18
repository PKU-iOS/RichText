//
//  NSString+Mobile.m
//  xyjmall
//
//  Created by mac on 15/7/15.
//  Copyright (c) 2015年 golvin. All rights reserved.
//

#import "NSString+RichText.h"

@implementation NSString (RichText)
- (NSString *) replaceCharactersAtRange:(NSRange) range withString:(NSString *)aString{
    NSMutableString *value = [NSMutableString stringWithString:self];
    [value replaceCharactersInRange:range withString:aString];
    return value;
}

- (NSArray *) rangeOfSuString:(NSString *) subString{
    NSRange range = [self rangeOfString:subString];
    NSMutableArray *rangeArr = [NSMutableArray array];
    if (range.location != NSNotFound) {
        [rangeArr addObject:[NSValue value:&range withObjCType:@encode(NSRange)]];
        while (range.location+range.length <= self.length && range.location != NSNotFound) {
            NSInteger oldLocation = range.location;//保存上一次的起始位置
            NSString *str = [self substringFromIndex:(range.location + range.length)];//取出后面的子串
            
            range = [str rangeOfString:subString];//从子串中查找
            if (range.location == NSNotFound) {//没找到则跳出循环
                break;
            }
            NSInteger location = range.location + oldLocation + range.length;//本次子串匹配到的location+父串上一次匹配到的location和length
            NSInteger length = range.length;
            
            range = NSMakeRange(location, length);
            [rangeArr addObject:[NSValue value:&range withObjCType:@encode(NSRange)]];
        }
    }
    
    for (int i=0; i<rangeArr.count; i++) {
        NSValue *value = rangeArr[i];
        NSRange rang = [value rangeValue];
        NSLog(@"%@",NSStringFromRange(range));
    }
    return rangeArr;
}

#pragma mark- 单个子串的属性设置
- (NSMutableAttributedString *) convertAttribute:(NSDictionary *) attributes withSubString:(NSString *)subString{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self];
    NSArray *ranges = [self rangeOfSuString:subString];
    for (NSValue *value in ranges) {
        NSRange range = [value rangeValue];
        [attributeString setAttributes:attributes range:range];
    }
    
    return attributeString;
}

#pragma mark- 多个子串的属性设置
- (NSMutableAttributedString *) convertAttributes:(NSArray *) attributes withSubStrings:(NSArray *)subStrings{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self];
    for (int i=0; i<subStrings.count; i++) {
        NSString *subString = subStrings[i];
        NSArray *ranges = [self rangeOfSuString:subString];
        NSDictionary *attribute = attributes[i];
        for (NSValue *value in ranges) {
            NSRange range = [value rangeValue];
            [attributeString setAttributes:attribute range:range];
        }
    }
    
    return attributeString;
}

@end
