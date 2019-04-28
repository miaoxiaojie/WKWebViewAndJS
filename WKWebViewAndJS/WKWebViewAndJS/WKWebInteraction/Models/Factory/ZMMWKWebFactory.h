//
//  ZMMWKWebFactory.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMMWKWebViewInterface.h"
#import "ZMMWKWebViewControllerInterface.h"
#import "ZMMWebJspHandleCenterInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMMWKWebFactory : NSObject

+ (id<ZMMWKWebViewInterface>)getWebViewControl:(CGRect)frame;
+ (id<ZMMWKWebViewControllerInterface>)getWebViewController;
+ (id<ZMMWebJspHandleCenterInterface>)getJspHandleCenter;

@end

NS_ASSUME_NONNULL_END
