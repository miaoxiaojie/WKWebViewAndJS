//
//  ZMMWebJspHandleCenterInterface.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMMWebCodeBaseHandleInterface.h"
#import <WebKit/WebKit.h>
@import UIKit;

@protocol ZMMWebJspHandleCenterInterface;

NS_ASSUME_NONNULL_BEGIN
@protocol ZMMWebJspHandleCenterInterface <NSObject>
@required

- (id<ZMMWebCodeBaseHandleInterface>)findRegisterCodehandle:(NSString *)eventCode;

-(void)addScriptHandler:(id <WKScriptMessageHandler>)handler
                webView:(WKWebView *)webView;

-(void)removeScriptHandler:(id <WKScriptMessageHandler>)handler
                   webView:(WKWebView *)webView;

NS_ASSUME_NONNULL_END
@end
