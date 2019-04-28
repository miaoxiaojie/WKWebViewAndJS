//
//  ZMMWebCodeBaseHandle.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMWebCodeBaseHandle.h"
#import "ZMMWKWebViewControllerInterface.h"


@interface ZMMWebCodeBaseHandle()

@property (weak, nonatomic)id<ZMMWKWebViewControllerInterface> webVc;
@property(strong,nonatomic)NSArray *codes;

@end

@implementation ZMMWebCodeBaseHandle

- (instancetype)init {
    self = [super init];
    if (self) {
        self.codes = [self setHandleCodesArray];
    }
    return self;
}

#pragma mark//公开接口
-(BOOL)handleWebName:(NSString*)name
                Body:(NSString*)body
{
    BOOL handle = NO;
    if ([self.codes containsObject:name]) {
        handle = YES;
        [self handleWebMessageName:name messageBody:body];
    }
    return handle;
    
}


+(NSArray*)handleCodes
{
    NSAssert(0, @"子类必须重载%s", __FUNCTION__);
    return nil;
}

-(NSArray*)setHandleCodesArray
{
    NSAssert(0, @"子类必须重载%s", __FUNCTION__);
    return nil;
}

-(void)handleWebMessageName:(NSString*)name
                messageBody:(NSString*)body
{
    NSAssert(0, @"子类必须重载%s", __FUNCTION__);
    
}

- (NSString *)formatCallBackStringWithFunc:(NSString *)callBackFunc
                                     param:(NSString *)param{
    if ([callBackFunc isEqualToString:@""]) {
        return @"";
    }
    NSString *callBackStr;
    if ([param isEqualToString:@""]) {
        callBackStr = [NSString stringWithFormat:@"%@()",callBackFunc];
    
    }else{
        callBackStr = [NSString stringWithFormat:@"%@('%@')",callBackFunc,param];
    }
    return callBackStr;
}

-(void)callBackToJsp:(NSString*)json
{
   //执行Js
   [[[self.webVc getWebView] systemWebView]  evaluateJavaScript:json completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        NSLog(@"value: %@ error: %@", response, error);
       
    }];
}

- (void)setWebViewController:(UIViewController *)viewController
{
    if ([viewController conformsToProtocol:@protocol(ZMMWKWebViewControllerInterface)]) {
        self.webVc = (id<ZMMWKWebViewControllerInterface>)viewController;
    } else {
      
    }
}

- (void)handleWebCode:(nonnull NSString *)code {
    
}

- (UIViewController *)getCodeWebViewController
{
    return [self.webVc getViewController];
}

@end
