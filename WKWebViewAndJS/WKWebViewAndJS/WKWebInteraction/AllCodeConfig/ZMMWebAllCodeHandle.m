//
//  ZMMWebAllCodeHandle.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMWebAllCodeHandle.h"
#import "ZMMAlertCodeHandle.h"
#import "ZMMWebViewConfig.h"
#import "ZMMTransferCodeHandle.h"

static void setAllCodeHandle()
{
    [ZMMWebViewConfig registerCodeHandle:[ZMMAlertCodeHandle class]];
    [ZMMWebViewConfig registerCodeHandle:[ZMMTransferCodeHandle class]];
}

const struct CMBCWebAllCodeHandle allCodeHandle = {
    .setAllCodeHandle = setAllCodeHandle,
    
};

