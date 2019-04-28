//
//  ZMMTransferCodeHandle.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/19.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMTransferCodeHandle.h"
#import "ZMMJSONParser.h"
#import "ZMMOtherFactory.h"
#import "ZMMPickViewInterface.h"

#undef  ZMMSelectBank
#define ZMMSelectBank               @"selectBank"

@implementation ZMMTransferCodeHandle

-(NSArray*)setHandleCodesArray
{
    return [ZMMTransferCodeHandle handleCodes];
}

+(NSArray*)handleCodes
{
    NSArray *array = [NSArray arrayWithObjects:ZMMSelectBank,nil];
    return array;
}

-(void)handleWebMessageName:(NSString*)name
                messageBody:(NSString*)body
{
    if([name isEqualToString:ZMMSelectBank])
    {
        NSDictionary *dict = [ZMMJSONParser decodeJsonString:body];
        NSString *callBack = [dict objectForKey:@"callback"];
        NSArray *cards = [dict objectForKey:@"cards"];
        if (cards.count == 0) {
            return;
        }
        ZMMMSelectBankCardBlock selectBlock = ^(NSString *bankCard){
            
            NSDictionary *dictResult = @{@"bank":bankCard};
            NSString *str = [ZMMJSONParser encodeJson:dictResult];
            //设置JS
            NSString *jsStr = [self formatCallBackStringWithFunc:callBack param:str];
            [self callBackToJsp:jsStr];
        };
        id<ZMMPickViewInterface> pickView = [ZMMOtherFactory getZMMPickView];
//        UIView *superView = [self getCodeWebViewController].view;
        //或者
        UIView *superView = [[[UIApplication sharedApplication].keyWindow rootViewController] view];
        [pickView showInView:superView bankCards:cards];
        [pickView setSelectBankCardBlock:selectBlock];

    }
    
}

@end
