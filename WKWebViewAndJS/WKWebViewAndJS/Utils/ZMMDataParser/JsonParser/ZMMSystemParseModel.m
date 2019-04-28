//
//  ZMMSystemParseModel.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/19.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMSystemParseModel.h"
#undef ZMMParaError
#define ZMMParaError                        @"参数不能为空"

@implementation ZMMSystemParseModel

-(NSDictionary*)decodeJsonString:(NSString *)str
{
    NSAssert(str != nil, ZMMParaError);
    NSDictionary *decodeDict = nil;
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    decodeDict = [self decodeJsonData:jsonData];
    return decodeDict;
}

-(NSDictionary*)decodeJsonData:(NSData*)data
{
    NSAssert(data != nil, ZMMParaError);
    NSDictionary *decodeDict = nil;
    NSError *error;
    
    decodeDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    return decodeDict;
}

-(NSString*)encodeJson:(NSDictionary*)dict
{
    NSAssert(dict != nil, ZMMParaError);
    NSString *jsonStr = nil;
    if([NSJSONSerialization isValidJSONObject:dict])
    {
        NSError *error;
        NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
        jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        //去除换行回车，服务器解析异常。
        jsonStr = [jsonStr stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    }
    return jsonStr;
}

@end
