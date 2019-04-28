//
//  NSString+ZMMCore.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/25.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "NSString+ZMMCore.h"

@implementation NSString (ZMMCore)

+ (BOOL)strNilOrEmpty:(NSString *)str
{
    if (!str||![str isKindOfClass:[NSString class]])
    {
        return YES;
    }
    return [str isStringEmpty];
}

- (BOOL)isStringEmpty
{
    return (0 == self.length) ? YES : NO;
    
}

@end
