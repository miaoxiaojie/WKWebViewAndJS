//
//  WebJspShareData.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMWebJspShareData.h"

@implementation ZMMWebJspShareData

+ (instancetype)shareInstance
{
    static ZMMWebJspShareData *webJspShareData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        webJspShareData = [[self alloc] init];
    });
    return webJspShareData;
}

- (instancetype)init
{
    if (self = [super init]) {
        _codeHandleNames = [[NSMutableSet alloc]initWithCapacity:1];
        _codeNames = [[NSMutableSet alloc]initWithCapacity:1];
    }
    return self;
    
}

@end
