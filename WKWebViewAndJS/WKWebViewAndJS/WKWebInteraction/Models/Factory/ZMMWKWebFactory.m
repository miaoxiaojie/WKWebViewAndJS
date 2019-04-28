//
//  ZMMWKWebFactory.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMWKWebFactory.h"
#import "ZMMWKWebView.h"
#import "ZMMWKWebViewController.h"
#import "ZMMWebJspHandleCenter.h"

@implementation ZMMWKWebFactory

+ (id<ZMMWKWebViewInterface>)getWebViewControl:(CGRect)frame
{
    id<ZMMWKWebViewInterface> webView = [[ZMMWKWebView alloc]initWithFrame:frame];
    return webView;
}
+ (id<ZMMWKWebViewControllerInterface>)getWebViewController
{
    ZMMWKWebViewController *webVC = [[ZMMWKWebViewController alloc]init];
    return webVC;
}

+ (id<ZMMWebJspHandleCenterInterface>)getJspHandleCenter
{
    id<ZMMWebJspHandleCenterInterface> center = [[ZMMWebJspHandleCenter alloc]init];;
    return center;
}

@end
