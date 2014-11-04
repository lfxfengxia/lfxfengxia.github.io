//
//  QYViewController.m
//  registerWeb
//
//  Created by qingyun on 14-11-3.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYViewController.h"
#import "RegrViewController.h"

@interface QYViewController ()

@end

@implementation QYViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainBackGround"]];
    imgView.userInteractionEnabled = YES;
    self.view = imgView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

#pragma mark - 设置登录首页提示信息
    UILabel *wellcomLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 280, 180)];
    wellcomLabel.text = @"wellcom to input this page to register a github account";
    wellcomLabel.textAlignment = NSTextAlignmentCenter;
    wellcomLabel.numberOfLines = 0;
    wellcomLabel.textColor = [UIColor blueColor];
    wellcomLabel.shadowColor = [UIColor yellowColor];
    wellcomLabel.shadowOffset = CGSizeMake(3, 3);
    wellcomLabel.font = [UIFont boldSystemFontOfSize:30];
    
    [self.view addSubview:wellcomLabel];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self buildBtn:registerBtn atX:100 y:260 width:120 hight:30 withTitle:@"register" andTag:10];
}

#pragma mark - 创建button方法
- (void)buildBtn:(UIButton *)btn atX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width hight:(CGFloat)hight withTitle:(NSString *)title andTag:(NSUInteger)tag
{
    btn.frame = CGRectMake(x, y, width, hight);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

#pragma mark - 设置点击button触发事件
- (void)clickBtn:(UIButton *)sender
{
   RegViewController *regViewCtrl = [[RegViewController alloc]init];
    [self.navigationController pushViewController:regViewCtrl animated:YES];
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
