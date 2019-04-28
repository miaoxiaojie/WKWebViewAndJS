//
//  ZMMPickViewInterface.h
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/22.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ZMMMSelectBankCardBlock)(NSString *bankCard);

@protocol ZMMPickViewInterface <NSObject>


/**
 显示alert

 @param aView 父视图
 @param cards 数据
 */
-(void)showInView:(UIView *)aView
            bankCards:(NSArray *)cards;

/*
 * 选择银行卡的回调
 */
- (void)setSelectBankCardBlock:(ZMMMSelectBankCardBlock)block;

@end


