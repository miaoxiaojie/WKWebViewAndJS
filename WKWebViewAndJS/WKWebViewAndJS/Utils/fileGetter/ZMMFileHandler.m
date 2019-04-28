//
//  ZMMFileHandler.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMFileHandler.h"

@implementation ZMMFileHandler

+(NSString *)pathForResourcePath:(NSString *)path
                          ofType:(NSString *)type
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:path ofType:type];
    return filePath;
}

+(NSString *)stringWithContentsOfFile:(NSString *)filePath
{
     NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    return htmlString;
}
@end
