//
//  ZMMWKWebViewInterface.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZMMWKWebViewInterface <NSObject>
@required

/**
 二阶段构造函数

 @param frame frame
 @return 对象
 */
- (instancetype)initWithFrame:(CGRect)frame;

/**
 获取系统浏览器对象
 */
-(WKWebView *)systemWebView;

/**
 *  设置webview依赖UIViewController
 *
 *  @param viewController 视图
 */
- (void)setWebViewViewController:(UIViewController *)viewController;

@optional
/**
 *  获取定制浏览器视图
 *
 *  @return 定制浏览器
 */
- (UIView *)getView;

@end

NS_ASSUME_NONNULL_END
