//
//  ZMMWebAllCodeHandle.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
extern const struct CMBCWebAllCodeHandle
{
    void (*setAllCodeHandle)(void);
    
} allCodeHandle;

