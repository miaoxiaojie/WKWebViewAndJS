//
//  ZMMWebViewConfig.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMMWebViewConfig : NSObject

/**
 *  注册codeHandle类 用于监听方式透传数据
 *
 *  @param codeHandle 类
 */
+ (void)registerCodeHandle:(nonnull Class)codeHandle;

@end

NS_ASSUME_NONNULL_END
