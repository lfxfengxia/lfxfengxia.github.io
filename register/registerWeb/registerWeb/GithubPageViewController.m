//
//  GithubPageViewController.m
//  registerWeb
//
//  Created by qingyun on 14-11-3.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "GithubPageViewController.h"
#import "CameraViewController.h"
#import "RegrViewController.h"

@interface GithubPageViewController ()

@end

@implementation GithubPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"个人中心";
    }
    return self;
}

- (void)loadView
{
    UIImageView *githubView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"githubBackGround.jpg"]];
    githubView.userInteractionEnabled = YES;
    self.view = githubView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
#pragma mark - UIBarButtonItem toolBar的设置
    self.navigationController.toolbarHidden = NO;
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(backToLastPage)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"查看信息" style:UIBarButtonItemStylePlain target:self action:@selector(showUserInfo)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    UIBarButtonItem *helpBarItem = [[UIBarButtonItem alloc]initWithTitle:@"Help" style:UIBarButtonItemStyleDone target:self action:@selector(helpFunc)];
    UIBarButtonItem *retBarItem = [[UIBarButtonItem alloc]initWithTitle:@"return to main page" style:UIBarButtonItemStyleDone target:self action:@selector(returnToMainPage)];
    retBarItem.width = 320;
    NSArray *items = [[NSArray alloc]initWithObjects:helpBarItem,retBarItem, nil];
    [self setToolbarItems:items];
#pragma mark - 设置UIActivityView
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.tintColor = [UIColor blueColor];
    activityIndicator.frame = CGRectMake(140, 200, 40, 40);
    activityIndicator.tintColor = [UIColor brownColor];
    activityIndicator.tag = 500;
    [self.view addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(stopAction:) userInfo:nil repeats:NO];
    
#pragma mark - 添加存储照片的相册按钮
    UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    photoBtn.backgroundColor = [UIColor brownColor];
    [self buildView:photoBtn atX:80 Y:400 width:160 hight:100];
    [photoBtn setTitle:@" 相册 " forState:UIControlStateNormal];
    [photoBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [photoBtn setBackgroundImage:[UIImage imageNamed:@"4.jpg"] forState:UIControlStateNormal];
    [photoBtn addTarget:self action:@selector(clickPhotoBtn) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 设置ActivityIndictator停止
- (void)stopAction:(UIActivityIndicatorView *)activityIndictator
{
    UILabel *anotherLabel = [[UILabel alloc]init];
    [self buildView:anotherLabel atX:30 Y:200 width:280 hight:100];
    [self buildLabel:anotherLabel andSetText:@"wellcom to input github page !" andAlignment:NSTextAlignmentLeft textColor:[UIColor cyanColor] tag:0];
    anotherLabel.font = [UIFont boldSystemFontOfSize:30];
    anotherLabel.shadowColor = [UIColor magentaColor];
    anotherLabel.shadowOffset = CGSizeMake(3, 3);
    anotherLabel.numberOfLines = 0;
    
    [self.view addSubview:anotherLabel];
    
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"expression"]];
    [self buildView:imgView atX:40 Y:100 width:60 hight:60];
    
    activityIndictator = (UIActivityIndicatorView *)[self.view viewWithTag:500];
    [activityIndictator stopAnimating];
}

#pragma mark - 设置toolbar的help键的触发事件
-(void)helpFunc
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"photos information" message:@"There are many photos,and its' color is purple" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alertView show];
}
#pragma mark - 设置点击“相册”按钮触发事件
- (void)clickPhotoBtn
{
    CameraViewController *cameraVc = [[CameraViewController alloc]init];
    
    [self.navigationController pushViewController:cameraVc animated:YES];
}

#pragma mark - 设置barButtonItem的“退出”键的触发事件
- (void)backToLastPage
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 设置toolBar的“返回主界面”键的触发事件
- (void)returnToMainPage
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - 设置barButtonItem的“查看信息”键的触发事件
- (void)showUserInfo
{
    UIActionSheet *infoAlertView = [[UIActionSheet alloc]initWithTitle:@"user information" delegate:self cancelButtonTitle:@"name" destructiveButtonTitle:@"phone number"otherButtonTitles:@"emil", nil];
    [infoAlertView showInView:self.view];
}

#pragma mark - 添加视图
- (void)buildView:(UIView *)view atX:(CGFloat)x Y:(CGFloat)y width:(CGFloat)width hight:(CGFloat)hight
{
    view.frame = CGRectMake(x, y, width, hight);
    [self.view  addSubview:view];
}

#pragma mark - 添加UILabel
- (void)buildLabel:(UILabel *)label andSetText:(NSString *)text andAlignment:(NSTextAlignment)alignment textColor:(UIColor *)color tag:(NSUInteger)tag
{
    label.text = text;
    label.textAlignment = alignment;
    label.textColor = color;
    label.tag = tag;
}

#pragma mark - actionSheet delegate 的实现
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        UILabel *firstLabel = [[UILabel alloc]init];
        firstLabel.backgroundColor = [UIColor brownColor];
        [self buildView:firstLabel atX:40 Y:160 width:240 hight:40];
        [self buildLabel:firstLabel andSetText:@"18749610101" andAlignment:NSTextAlignmentCenter textColor:[UIColor greenColor] tag:0];
    }else if( buttonIndex == 1){
        UILabel *secondLabel = [[UILabel alloc]init];
        secondLabel.backgroundColor = [UIColor brownColor];
        [self buildView:secondLabel atX:40 Y:160 width:240 hight:40];
        [self buildLabel:secondLabel andSetText:@"hellokity@sina.com" andAlignment:NSTextAlignmentCenter textColor:[UIColor greenColor] tag:0];
    }else{
        UILabel *thirdLabel = [[UILabel alloc]init];
        thirdLabel.backgroundColor = [UIColor brownColor];
        [self buildView:thirdLabel atX:40 Y:160 width:240 hight:40];
        [self buildLabel:thirdLabel andSetText:@"hellokity" andAlignment:NSTextAlignmentCenter textColor:[UIColor greenColor] tag:0];
    }
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
