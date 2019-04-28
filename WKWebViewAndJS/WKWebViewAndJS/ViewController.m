//
//  ViewController.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/12.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ViewController.h"
#import "ZMMWKWebViewControllerInterface.h"
#import "ZMMWKWebFactory.h"
#import "ZMMWKWebViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = @[@"WKWebView加载简单的交互",@"WKWebView与前端转账的交互",@"WKWebView请求URL"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUITabView];
   
}

-(void)setupUITabView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64, self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:tableView];

}

#pragma mark --------------------------------------------------
#pragma mark - tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  id<ZMMWKWebViewControllerInterface> webKit = [ZMMWKWebFactory getWebViewController];
    UIViewController *vc = [webKit getViewController];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        NSString *simpFilePath = [[NSBundle mainBundle]pathForResource:@"indexSimple" ofType:@"html"];
        NSString *htmlPath = [NSString stringWithContentsOfFile:simpFilePath encoding:NSUTF8StringEncoding error:nil];
        [webKit loadHTMLString:htmlPath baseURL:nil];

    }else if (indexPath.row == 1){
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
        NSURL *fileURL = [NSURL fileURLWithPath:filePath];
        [webKit loadFileUrl:fileURL];
    }else if (indexPath.row == 2){
        [webKit loadUrl:@"https://blog.csdn.net/Z1591090/article/details/89479993"];
    }
    [webKit setContainerViewSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
