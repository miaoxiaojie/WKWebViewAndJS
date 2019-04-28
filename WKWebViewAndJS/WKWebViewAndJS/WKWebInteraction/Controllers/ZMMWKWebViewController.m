//
//  ZMMWKWebViewController.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/15.
//  Copyright © 2019年 miao. All rights reserved.
//
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#import "ZMMWKWebViewController.h"
#import "ZMMWKWebViewInterface.h"
#import "ZMMWKWebFactory.h"
#import <WebKit/WebKit.h>
#import "ZMMWebAllCodeHandle.h"
#import "ZMMWebJspHandleCenterInterface.h"
#import "ZMMWebCodeBaseHandleInterface.h"
#import "ZMMWebJspShareData.h"

@interface ZMMWKWebViewController ()<
WKUIDelegate,
WKNavigationDelegate,
WKScriptMessageHandler
>

@property(strong, nonatomic)id<ZMMWKWebViewInterface> webView;
@property (strong, nonatomic)id<ZMMWebJspHandleCenterInterface> jshandleCenter;

@end

@implementation ZMMWKWebViewController

-(instancetype)init{
    if (self = [super init]) {
        [self p_configWebViewRecources];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[self.webView getView]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.webView systemWebView].UIDelegate = self;
    [self.webView systemWebView].navigationDelegate = self;
    [self.jshandleCenter addScriptHandler:self webView:[self.webView systemWebView]];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.jshandleCenter removeScriptHandler:self webView:[self.webView systemWebView]];
    [self.webView systemWebView].UIDelegate = nil;
    [self.webView systemWebView].navigationDelegate = nil;
}

-(void)p_configWebViewRecources
{
   //用单利资源
    static dispatch_once_t once;
    dispatch_once(&once, ^{
      allCodeHandle.setAllCodeHandle();
    });
    
}

#pragma mark - 系统webview二次封装接口

- (void)loadUrl:(NSString *)url
{
    if ([NSString strNilOrEmpty:url]) {
        return;
    }
    NSString *fullServerUrl = url;
    NSURL *loadUrl = [[NSURL alloc] initWithString:fullServerUrl];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:loadUrl
                                              cachePolicy:0
                                          timeoutInterval:30];
    [self loadRequest:req];
}

- (void)loadRequest:(NSURLRequest *)request
{
     [[self.webView systemWebView] loadRequest:request];
}

- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
    [[self.webView systemWebView]loadHTMLString:string baseURL:baseURL];
}

-(void)loadFileUrl:(NSURL *)fileUrl
{
    [[self.webView systemWebView]loadFileURL:fileUrl allowingReadAccessToURL:fileUrl];
}

-(UIViewController *)getViewController
{
    return self;
}
-(id<ZMMWKWebViewInterface>)getWebView
{
    return _webView;
}

- (void)setContainerViewSize:(CGSize)theViewSize
{
   CGRect frame = CGRectMake(0.0, 0.0, theViewSize.width, theViewSize.height);
   [self.view setFrame:frame];
    
}


#pragma mark - WWKNavigationDelegate
//开始加载
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    //页面开始加载.
    
    //可以在这里做加载动画,然后在加载完成代理里面移除动画即可!
}

//网络错误
-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    //网络报错
}

//网页加载完成
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
}


#pragma mark --------------------------------------------------
#pragma mark - WKUIDelegate
// alert
//此方法作为js的alert方法接口的实现，默认弹出窗口应该只有提示信息及一个确认按钮，当然可以添加更多按钮以及其他内容，但是并不会起到什么作用
//点击确认按钮的相应事件需要执行completionHandler，这样js才能继续执行
////参数 message为  js 方法 alert(<message>) 中的<message>
-(void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}
// confirm
//作为js中confirm接口的实现，需要有提示信息以及两个相应事件， 确认及取消，并且在completionHandler中回传相应结果，确认返回YES， 取消返回NO
//参数 message为  js 方法 confirm(<message>) 中的<message>
-(void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

// prompt
//作为js中prompt接口的实现，默认需要有一个输入框一个按钮，点击确认按钮回传输入值
//当然可以添加多个按钮以及多个输入框，不过completionHandler只有一个参数，如果有多个输入框，需要将多个输入框中的值通过某种方式拼接成一个字符串回传，js接收到之后再做处理
//参数 prompt 为 prompt(<message>, <defaultValue>);中的<message>
//参数defaultText 为 prompt(<message>, <defaultValue>);中的 <defaultValue>
-(void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    
    [alertController addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(alertController.textFields[0].text?:@"");
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}


#pragma mark --------------------------------------------------
#pragma mark - WLScriptMessageHandler
//js传递过来的数据
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    NSLog(@"%@",message.name);//方法名
    if (![NSString strNilOrEmpty:message.name]) {
        id<ZMMWebCodeBaseHandleInterface> codeHandle = [self.jshandleCenter findRegisterCodehandle:message.name];
         [codeHandle setWebViewController:self];
        [codeHandle handleWebName:message.name Body:message.body];

    }
}


//#pragma mark - setter/getter
- (id<ZMMWKWebViewInterface>)webView
{
    if (_webView) {
        return _webView;
    }
    _webView = [ZMMWKWebFactory getWebViewControl:CGRectMake(0,64,kScreenW, kScreenH)];
    [_webView systemWebView].UIDelegate = self;
    [_webView systemWebView].navigationDelegate = self;
    [_webView setWebViewViewController:self];
    return _webView;

}

- (id<ZMMWebJspHandleCenterInterface>)jshandleCenter
{
    if (_jshandleCenter) {
        return _jshandleCenter;
    }
    _jshandleCenter = [ZMMWKWebFactory getJspHandleCenter];
    return _jshandleCenter;
    
}

@end
