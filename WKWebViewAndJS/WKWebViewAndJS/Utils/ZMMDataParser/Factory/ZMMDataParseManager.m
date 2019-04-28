//
//  ZMMDataParseManager.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/19.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMDataParseManager.h"
#import "ZMMSystemParseModel.h"

@implementation ZMMDataParseManager

+(id<ZMMJsonParseProtocol>)JsonParseObject
{
    id<ZMMJsonParseProtocol>  object = [[ZMMSystemParseModel alloc] init];
    return object;
}

@end
