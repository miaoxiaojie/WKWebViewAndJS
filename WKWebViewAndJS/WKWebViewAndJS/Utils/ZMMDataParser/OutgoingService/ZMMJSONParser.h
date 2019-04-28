//
//  ZMMJSONParser.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/19.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMMJSONParser : NSObject

/**
 *  将json串转换成字典
 *
 *  @param jsonString 字符串
 *
 *  @return 字典
 */

+(NSDictionary*)decodeJsonString:(NSString*)jsonString;

/**
 *  将字典转换成json串
 *
 *  @param dict 字典
 *
 *  @return json 串
 */
+(NSString*)encodeJson:(NSDictionary*)dict;


@end

NS_ASSUME_NONNULL_END
