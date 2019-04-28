//
//  ZMMWebJspHandleCenter.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMMWebJspHandleCenterInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMMWebJspHandleCenter : NSObject<ZMMWebJspHandleCenterInterface>

+ (BOOL)registerCodeHandleObject:(Class)object;

@end

NS_ASSUME_NONNULL_END
