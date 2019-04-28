//
//  WebJspShareData.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMMWebJspShareData : NSObject

@property(strong, nonatomic)NSMutableSet *codeHandleNames;
@property(strong, nonatomic)NSMutableSet *codeNames;
+ (instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
