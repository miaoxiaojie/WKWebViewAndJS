//
//  ZMMWebJspHandleCenter.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMWebJspHandleCenter.h"
#import "ZMMWebJspShareData.h"
#import "ZMMWebCodeBaseHandleInterface.h"
#import <objc/runtime.h>

@interface ZMMWebJspHandleCenter()
@property(strong, nonatomic)NSMutableSet *codeHandleNames;
@property(strong,nonatomic)NSMutableSet *codeNames;
@end


@implementation ZMMWebJspHandleCenter

+ (BOOL)registerCodeHandleObject:(Class)object
{
    ZMMWebJspShareData *centerData = [ZMMWebJspShareData shareInstance];
    BOOL result = NO;
    __block BOOL needAddToSet = YES;
    [centerData.codeHandleNames enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        if([obj isKindOfClass:object])
        {
            needAddToSet = NO;
            *stop = YES;
        }
    }];
    
    if (!needAddToSet) {
        return result;
    }
    
    if ([object conformsToProtocol:@protocol(ZMMWebCodeBaseHandleInterface)]) {
        NSArray *codes = [object handleCodes];
        for (NSString *name in codes) {
            [centerData.codeNames addObject:name];
        }
        NSString *className = NSStringFromClass(object);
        if (className) {
            [centerData.codeHandleNames addObject:className];
        }
        
    }
    return result;
    
}

-(void)addScriptHandler:(id <WKScriptMessageHandler>)handler
                webView:(WKWebView *)webView
{
    ZMMWebJspShareData *centerData = [ZMMWebJspShareData shareInstance];
    for (NSString *name in centerData.codeNames) {
        [webView.configuration.userContentController addScriptMessageHandler:handler name:name];
    }
}

-(void)removeScriptHandler:(id <WKScriptMessageHandler>)handler
                   webView:(WKWebView *)webView
{
    ZMMWebJspShareData *centerData = [ZMMWebJspShareData shareInstance];
    
    for (NSString *name in centerData.codeNames) {
        [webView.configuration.userContentController removeScriptMessageHandlerForName:name];
    }
}

- (id<ZMMWebCodeBaseHandleInterface>)findRegisterCodehandle:(NSString *)eventCode
{
    id<ZMMWebCodeBaseHandleInterface> currentCodeHandle = [self p_getCodeHandleByEventCode:eventCode];
  
    return currentCodeHandle;
}

- (id<ZMMWebCodeBaseHandleInterface>)p_getCodeHandleByEventCode:(NSString *)eventCode
{
    id<ZMMWebCodeBaseHandleInterface> findobject = nil;
    Class findClass = [self p_findClassInCodeHandleNames:eventCode];
    if (findClass != NULL ) {
        findobject = [[findClass alloc]init];
    }
    
    return findobject;
}

- (Class)p_findClassInCodeHandleNames:(NSString *)eventCode
{
    if (!eventCode
        || [eventCode isStringEmpty]) {
        return nil;
    }
    __block Class findobject = NULL;
    [self.codeHandleNames enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        NSString *className = obj;
        Class codeClass = NSClassFromString(className);
        if (codeClass) {
            Method handleMethod = class_getClassMethod(codeClass, @selector(handleCodes));
            if (handleMethod != NULL)
            {
                NSArray *codes = [codeClass handleCodes];
                NSInteger findIndex = [codes indexOfObject:eventCode];
                if (findIndex != NSNotFound) {
                    findobject = codeClass;
                    *stop = YES;
                }
            }
        }
        
    }];
    return findobject;

}

#pragma mark - getter/setter
- (NSMutableSet *)codeHandleNames
{
    if (_codeHandleNames) {
        return _codeHandleNames;
    }
    _codeHandleNames = [ZMMWebJspShareData shareInstance].codeHandleNames;
    return _codeHandleNames;
}
-(NSMutableSet *)codeNames{
    if (_codeNames) {
        return _codeNames;
    }
    _codeNames = [ZMMWebJspShareData shareInstance].codeNames;
    return _codeNames;
}

@end
