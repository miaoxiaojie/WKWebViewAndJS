//
//  ZMMJSONParser.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/19.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMJSONParser.h"
#import "ZMMJsonParseProtocol.h"
#import "ZMMDataParseManager.h"

@implementation ZMMJSONParser

+(NSDictionary*)decodeJsonString:(NSString*)jsonString
{
    if (!jsonString||![jsonString isKindOfClass:[NSString  class]]) {
        return @{};
    }
    id<ZMMJsonParseProtocol> object = [ZMMDataParseManager JsonParseObject];
    //json转换为字典
    return [object decodeJsonString:jsonString];
}

+(NSString*)encodeJson:(NSDictionary*)dict
{
    if (!dict) {
        return @"";
    }
    id<ZMMJsonParseProtocol> object = [ZMMDataParseManager JsonParseObject];
    
    return [object encodeJson:dict];
}

@end
