//
//  ZMMWebCodeBaseHandleInterface.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@protocol ZMMWebCodeBaseHandleInterface <NSObject>
@required

/**
 *  数据回传jsp页面
 */
-(void)callBackToJsp:(NSString*)json;

/**
 * handle 是否包含 name
 * @param name name
 * @param body 客户端的数据
 */
-(BOOL)handleWebName:(NSString*)name
                Body:(NSString*)body;

/**
 *  code对象处理哪些code
 *
 *  @return 处理code集合
 */
+(NSArray*)handleCodes;

/**
 *  需要设置的code处理集合
 *
 *  @return code数组
 */
-(NSArray*)setHandleCodesArray;

/**
 *  code 处理入口
 *
 *  @param code 事件code
 */
-(void)handleWebCode:(NSString*)code;

/**
 *  用于浏览器监测调用code处理
 *
 *  @param name 事件name
 *  @param body 事件数据
 *
 */
-(void)handleWebMessageName:(NSString*)name
                messageBody:(NSString*)body;

/**
 *  设置code处理对象依赖vc对象，用于code处理一些UI操作
 *  例如：push vc addsubview等
 *
 *  @param viewController 系统viewcontroller
 */

- (void)setWebViewController:(UIViewController *)viewController;

/**
 *
 *  获得getCodeWebViewController
 *
 */
- (UIViewController *)getCodeWebViewController;

/**
 *  格式化参数至回调函数中异常返回@""
 *
 *  @param callBackFunc 服务器回调函数名称
 *  @param param       参数
 *
 *  @return 格式化结果
 */
- (NSString *)formatCallBackStringWithFunc:(NSString *)callBackFunc
                                     param:(NSString *)param;

@end

NS_ASSUME_NONNULL_END
