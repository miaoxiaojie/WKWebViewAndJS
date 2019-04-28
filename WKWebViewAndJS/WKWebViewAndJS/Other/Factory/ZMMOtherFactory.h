//
//  ZMMOtherFactory.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/22.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMMPickViewInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMMOtherFactory : NSObject

+(id<ZMMPickViewInterface>)getZMMPickView;


@end

NS_ASSUME_NONNULL_END
