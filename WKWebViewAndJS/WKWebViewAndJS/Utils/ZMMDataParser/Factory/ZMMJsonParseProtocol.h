//
//  ZMMJsonParseProtocol.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/19.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZMMJsonParseProtocol <NSObject>

@optional
/**
 *  json字符串转换为字典
 *
 *  @param str json字符串
 *
 *  @return dict字典
 */
-(NSDictionary*)decodeJsonString:(NSString *)str;

/**
 *  将字典转换成json串
 *
 *  @param dict 字典
 *
 *  @return 字符串
 */
+(NSString*)encodeJson:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END
