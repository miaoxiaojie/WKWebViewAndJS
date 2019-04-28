//
//  ZMMWKWebView.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMWKWebView.h"

@interface ZMMWKWebView()

@property (strong, nonatomic) WKWebView *systemWebView;
@property (weak, nonatomic) UIViewController *webViewController;
@end


@implementation ZMMWKWebView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self p_prepareForWebView];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self p_createSystemWebView];
}

-(void)dealloc
{
    [self p_destorySystemWebView];
}

#pragma mark - public Method
-(WKWebView *)systemWebView
{
    return _systemWebView;
}

- (void)setWebViewViewController:(UIViewController *)viewController
{
    self.webViewController = viewController;
}
- (UIView *)getView
{
    return self;
}

- (void)clearWebViewSubViews
{
    
}
#pragma mark - private Method

-(void)p_prepareForWebView
{
    if([NSThread isMainThread])
    {
        [self p_createSystemWebView];
    }
    else
    {
        [self performSelectorOnMainThread:@selector(p_createSystemWebView) withObject:nil waitUntilDone:YES];
    }
    
}

-(void)p_createSystemWebView
{
    if (_systemWebView) {
        return;
    }
     WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    _systemWebView = [[WKWebView alloc]initWithFrame:self.bounds configuration:config];
    //不通过用户交互，是否可以打开窗口
    config.preferences.javaScriptCanOpenWindowsAutomatically = true;
    //是否支持JavaScript
    config.preferences.javaScriptEnabled = true;
    [config.preferences setValue:@YES forKey:@"allowFileAccessFromFileURLs"];
    [_systemWebView setBackgroundColor:[UIColor whiteColor]];
    if(![_systemWebView isDescendantOfView:self])
    {
        [self addSubview:_systemWebView];
    }

}

-(void)p_destorySystemWebView
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    if(_systemWebView)
    {
        [_systemWebView stopLoading];
        if([_systemWebView superview])
        {
            [_systemWebView removeFromSuperview];
        }
        _systemWebView = nil;
    }
    
}

@end
