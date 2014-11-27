//
//  WebViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-14.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property(nonatomic,strong)UIWebView *webView;

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"UIWebView";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    _webView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4"]];
    _webView.delegate = self;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    [self.view addSubview:_webView];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
//    NSString *errorHtml = [NSString stringWithFormat:@"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"><html><head><meta http-equiv='Content-Type' content='text/html;charset=utf-8'><title></title></head><body><div style='width: 100%%; text-align: center; font-size: 12px; color: red;'>An error occurred:<br>%@</div></body></html>",error.localizedDescription];
//    [_webView loadHTMLString:errorHtml baseURL:nil];
    NSString *errorHtml = @"error";
    [_webView loadHTMLString:errorHtml baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
