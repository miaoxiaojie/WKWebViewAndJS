//
//  ZMMWKWebViewControllerInterface.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZMMWKWebViewInterface.h"
@class ZMMWKWebViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol ZMMWKWebViewControllerInterface <NSObject>

- (void)loadUrl:(NSString *)url;
- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL;
- (void)loadRequest:(NSURLRequest *)request;
-(void)loadFileUrl:(NSURL *)fileUrl;
- (UIViewController *)getViewController;
- (void)setContainerViewSize:(CGSize)theViewSize;
-(id<ZMMWKWebViewInterface>)getWebView;

@end

NS_ASSUME_NONNULL_END
