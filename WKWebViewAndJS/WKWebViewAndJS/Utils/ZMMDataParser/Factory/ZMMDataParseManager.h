//
//  ZMMDataParseManager.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/19.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMMJsonParseProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMMDataParseManager : NSObject

+(id<ZMMJsonParseProtocol>)JsonParseObject;

@end

NS_ASSUME_NONNULL_END
