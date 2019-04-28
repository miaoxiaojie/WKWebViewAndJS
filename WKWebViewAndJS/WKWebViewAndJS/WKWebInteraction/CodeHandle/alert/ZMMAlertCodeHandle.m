//
//  ZMMAlertCodeHandle.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMAlertCodeHandle.h"

#undef ZMMSHOW
#define ZMMSHOW @"show"

@implementation ZMMAlertCodeHandle

-(NSArray*)setHandleCodesArray
{
    return [ZMMAlertCodeHandle handleCodes];
}

+(NSArray*)handleCodes
{
    NSArray *array = [NSArray arrayWithObjects:ZMMSHOW,nil];
    return array;
}

-(void)handleWebMessageName:(NSString*)name
                messageBody:(NSString*)body
{
    if([name isEqualToString:ZMMSHOW])
    {
        //设置JS
        NSString *jsStr = @"share('传过去的数据')";
        [self callBackToJsp:jsStr];
    }
    
}

@end
