//
//  NSString+ZMMCore.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/25.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZMMCore)

/**
 判断字符串是否为空
 
 @param str 需判断的字符串
 @return BOOL
 */
+ (BOOL)strNilOrEmpty:(NSString *)str;

/**
 判断字符串长度是否为0
 
 @return BOOL
 */
- (BOOL)isStringEmpty;

@end

NS_ASSUME_NONNULL_END
