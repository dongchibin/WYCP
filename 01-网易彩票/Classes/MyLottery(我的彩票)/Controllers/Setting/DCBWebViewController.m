//
//  DCBWebViewController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/25.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBWebViewController.h"
#import "DCBHelp.h"

@interface DCBWebViewController ()<UIWebViewDelegate>

@end

@implementation DCBWebViewController

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *ID = self.cellHelp.ID;
    
    NSString *jsCode = [NSString stringWithFormat:@"document.location.href = '#%@';", ID];
    
    [webView stringByEvaluatingJavaScriptFromString:jsCode];
}

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    
    self.view = webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *disItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(dismissBtnClick)];
    
    self.navigationItem.leftBarButtonItem = disItem;
    
    UIWebView *webView = (UIWebView *)self.view;
    
    webView.delegate = self;
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.cellHelp.html withExtension:nil];
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    
    [webView loadRequest:urlRequest];
}

- (void)dismissBtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
