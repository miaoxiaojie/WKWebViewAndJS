//
//  ZMMOtherFactory.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/22.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMOtherFactory.h"
#import "ZMMPickView.h"

@implementation ZMMOtherFactory

+(id<ZMMPickViewInterface>)getZMMPickView
{
    id<ZMMPickViewInterface> pickView = [[ZMMPickView alloc]init];
    return pickView;
}
@end
