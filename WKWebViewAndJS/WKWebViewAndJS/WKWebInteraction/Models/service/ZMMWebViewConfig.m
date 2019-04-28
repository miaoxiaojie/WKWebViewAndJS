//
//  ZMMWebViewConfig.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMWebViewConfig.h"
#import "ZMMWebJspHandleCenter.h"

@implementation ZMMWebViewConfig

+ (void)registerCodeHandle:(nonnull Class)codeHandle

{
    [ZMMWebJspHandleCenter registerCodeHandleObject:codeHandle];
}


@end
