//
//  ZMMFileHandler.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMMFileHandler : NSObject

+(NSString *)pathForResourcePath:(NSString *)path
                          ofType:(NSString *)type;

+(NSString *)stringWithContentsOfFile:(NSString *)filePath;

@end

NS_ASSUME_NONNULL_END
