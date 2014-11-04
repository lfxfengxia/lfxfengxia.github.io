//
//  RegViewController.m
//  registerWeb
//
//  Created by qingyun on 14-11-3.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "RegrViewController.h"
#import "GithubPageViewController.h"

@interface RegViewController ()

@end

@implementation RegViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"github register";
    }
    return self;
}

- (void)loadView
{
//    UIImageView *refgImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
//    regImgView.userInteractionEnabled = YES;
//    self.view = regImgView;
  
    UIView *regView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    regView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"registerBackGround.jpg"]];
    self.view = regView;
}

#pragma mark - 设置注册信息列表
- (void)viewDidLoad
{
    [super viewDidLoad];
    
#pragma  mark - 设置注册主题
    UILabel *maintitle = [[UILabel alloc]init];
    [self addView:maintitle atX:110 Y:70 width:100 hight:40];
    [self addLabel:maintitle andSetText:@"github" andAlignment:NSTextAlignmentCenter textColor:[UIColor magentaColor] tag:0];
    maintitle.font = [UIFont boldSystemFontOfSize:30];
    maintitle.shadowColor = [UIColor blueColor];
    maintitle.shadowOffset = CGSizeMake(3, 3);
    
#pragma mark - 设置用户名的输入区
    UILabel *userLabel1 = [[UILabel alloc]init];
    [self addView:userLabel1 atX:2 Y:120 width:100 hight:20];
    [self addLabel:userLabel1 andSetText:@"user name: "andAlignment:NSTextAlignmentRight textColor:[UIColor purpleColor] tag:11];
    
    UITextField *userTextField = [[UITextField alloc]init];
    [self addView:userTextField atX:105 Y:120 width:210 hight:20];
    [self addTextField:userTextField andSetKeyboardType:UIKeyboardTypeNamePhonePad placeHolder:@"Please input user name" andLeftImg:@"human" tag:10];
    UILabel *userLabel2 = [[UILabel alloc]init];
    [self addView:userLabel2 atX:105 Y:142 width:210 hight:20];
    [self addLabel:userLabel2 andSetText:@"length must in [1,10]" andAlignment:NSTextAlignmentLeft textColor:[UIColor orangeColor] tag:12];
    
#pragma mark - 设置邮箱输入区
    UILabel *emilLabel1 = [[UILabel alloc]init];
    [self addView:emilLabel1 atX:2 Y:165 width:100 hight:20];
    [self addLabel:emilLabel1 andSetText:@"emil: " andAlignment:NSTextAlignmentRight textColor:[UIColor purpleColor] tag:21];
    
    UITextField *emilTextField = [[UITextField alloc]init];
    [self addView:emilTextField atX:105 Y:165 width:210 hight:20];
    [self addTextField:emilTextField andSetKeyboardType:UIKeyboardTypeEmailAddress placeHolder:@"Input user emil" andLeftImg:@"emil" tag:20];
    
    UILabel *emilLabel2 = [[UILabel alloc]init];
    [self addView:emilLabel2 atX:105 Y:187 width:210 hight:60];
    [self addLabel:emilLabel2 andSetText:@"not is qq.com and is *.com,length must > 7" andAlignment:NSTextAlignmentLeft textColor:[UIColor orangeColor] tag:22];
    emilLabel2.numberOfLines = 2;
    
#pragma mark - 设置手机号码输入区
    UILabel *phoneLabel1 = [[UILabel alloc]init];
    [self addView:phoneLabel1 atX:2 Y:250 width:100 hight:20];
    [self addLabel:phoneLabel1 andSetText:@"phone num: " andAlignment:NSTextAlignmentRight textColor:[UIColor purpleColor] tag:31];
    
    UITextField *phoneTextField = [[UITextField alloc]init];
    [self addView:phoneTextField atX:105 Y:250 width:210 hight:20];
    [self addTextField:phoneTextField andSetKeyboardType:UIKeyboardTypeNumberPad placeHolder:@"Input user phonenum" andLeftImg:@"phone" tag:30];
    
    UILabel *phoneLabel2 = [[UILabel alloc]init];
    [self addView:phoneLabel2 atX:105 Y:272 width:210 hight:20];
    [self addLabel:phoneLabel2 andSetText:@"leght only is 11 (187***)" andAlignment:NSTextAlignmentLeft textColor:[UIColor orangeColor] tag:32];
    
#pragma mark - 设置密码输入区
    UILabel *psdLabel1 = [[UILabel alloc]init];
    [self addView:psdLabel1 atX:2 Y:295 width:100 hight:20];
    [self addLabel:psdLabel1 andSetText:@"password: " andAlignment:NSTextAlignmentRight textColor:[UIColor purpleColor] tag:41];
    
    UITextField *psdTextField = [[UITextField alloc]init];
    [self addView:psdTextField atX:105 Y:295 width:210 hight:20];
    [self addTextField:psdTextField andSetKeyboardType:UIKeyboardTypeDefault placeHolder:@"Input password" andLeftImg:@"lock" tag:40];
    psdTextField.secureTextEntry = YES;
    
    UILabel *psdLabel2 = [[UILabel alloc]init];
    [self addView:psdLabel2 atX:105 Y:317 width:232 hight:20];
    [self addLabel:psdLabel2 andSetText:@"length must in [8,12]" andAlignment:NSTextAlignmentLeft textColor:[UIColor orangeColor] tag:42];
    
#pragma mark - 设置密码确认输入区
    UILabel *secPsdLabel1 = [[UILabel alloc]init];
    [self addView:secPsdLabel1 atX:2 Y:340 width:100 hight:20];
    [self addLabel:secPsdLabel1 andSetText:@"Again input: " andAlignment:NSTextAlignmentRight textColor:[UIColor purpleColor] tag:51];
    
    UITextField *secPsdTextField = [[UITextField alloc]init];
    [self addView:secPsdTextField atX:105 Y:340 width:210 hight:20];
    [self addTextField:secPsdTextField andSetKeyboardType:UIKeyboardTypeDefault placeHolder:@"Input secret code" andLeftImg:@"lock" tag:50];
    secPsdTextField.secureTextEntry = YES;
    
    UILabel *secPsdLabel2 = [[UILabel alloc]init];
    [self addView:secPsdLabel2 atX:105 Y:362 width:210 hight:60];
    [self addLabel:secPsdLabel2 andSetText:@"password must be same to previous password" andAlignment:NSTextAlignmentLeft textColor:[UIColor orangeColor] tag:52];
    secPsdLabel2.numberOfLines = 2;
    
#pragma mark - 设置注册按钮
    UIButton *regBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    regBtn.frame = CGRectMake(100, 430, 60, 30);
    regBtn.backgroundColor = [UIColor cyanColor];
    [regBtn setTitle:@"register" forState:UIControlStateNormal];
    [regBtn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    regBtn.tag = 100;
    [self.view addSubview:regBtn];
    
    [regBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark - 设置登录按钮
    UIButton *lgBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    lgBtn.frame = CGRectMake(190, 430, 60, 30);
    lgBtn.backgroundColor = [UIColor cyanColor];
    [lgBtn setTitle:@"login" forState:UIControlStateNormal];
    [lgBtn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    lgBtn.tag = 200;
    [self.view addSubview:lgBtn];
    
    [lgBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark - 添加美化图片
    UIImageView *imgView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hellokity"]];
    [self addView:imgView1 atX:30 Y:450 width:80 hight:80];
    
    UIImageView *imgView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"face"]];
    [self addView:imgView2 atX:240 Y:70 width:60 hight:60];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"naBarBack"] forBarMetrics:UIBarMetricsLandscapePhone];
}

#pragma mark - 添加视图
- (void)addView:(UIView *)view atX:(CGFloat)x Y:(CGFloat)y width:(CGFloat)width hight:(CGFloat)hight
{
    view.frame = CGRectMake(x, y, width, hight);
    [self.view  addSubview:view];
}

#pragma mark - 添加UILabel
- (void)addLabel:(UILabel *)label andSetText:(NSString *)text andAlignment:(NSTextAlignment)alignment textColor:(UIColor *)color tag:(NSUInteger)tag
{
    label.text = text;
    label.textAlignment = alignment;
    label.textColor = color;
    label.tag = tag;
}

#pragma mark - 添加UITextField
- (void)addTextField:(UITextField *)textField andSetKeyboardType:(UIKeyboardType)keyboardType placeHolder:(NSString *)placeHolder andLeftImg:(NSString *)imgName tag:(NSUInteger)tag
{
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = placeHolder;
    textField.keyboardType = keyboardType;
    textField.tag = tag;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.clearsOnBeginEditing = YES;
    
    UIImage *img = [UIImage imageNamed:imgName];
    UIImageView *leftImg = [[UIImageView alloc]initWithImage:img];
    leftImg.frame = CGRectMake(0, 0, 14, 17);
    textField.leftView = leftImg;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    textField.delegate = self;
}

#pragma mark - 设置点击button的触发方法
- (void)clickBtn:(UIButton *)sender
{
    
    if (sender.tag == 100) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"register successfully" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [actionSheet showInView:self.view];
    }
    if (sender.tag == 200) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"login successfully" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [actionSheet showInView:self.view];
    }
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.frame = CGRectMake(140, 200, 40, 40);
    activityIndicator.tintColor = [UIColor brownColor];
    activityIndicator.tag = 500;
    
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(stopAction:) userInfo:nil repeats:NO];
    }

#pragma mark - 设置ActivityIndictator停止
- (void)stopAction:(UIActivityIndicatorView *)activityIndictator
{
    GithubPageViewController *githubVc = [[GithubPageViewController alloc]init];
    [self.navigationController pushViewController:githubVc animated:YES];
    activityIndictator = (UIActivityIndicatorView *)[self.view viewWithTag:500];
    [activityIndictator stopAnimating];
}

#pragma mark - 设置警告
- (void)builtAlertView:(UIAlertView *)alertView FromFirstLabel:(UILabel *)label1 andSecLabel:(UILabel *)label2
{
    alertView = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Alert from %@",label1.text] message:label2.text delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"modify", nil];
    [alertView show];
}

#pragma mark - 获取buttonIndex
/*
 - (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
 {
 int tag = 10;
 UITextField *textField = (UITextField *)[self.view viewWithTag:tag];
 if (buttonIndex == 0) {
 [textField resignFirstResponder];
 }
 }
 */
/*
 - (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
 {
 NSLog(@"%d",buttonIndex);
 }
 
 - (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
 {
 NSLog(@"%s",__func__);
 return YES;
 }
 
 - (void)textFieldDidBeginEditing:(UITextField *)textField
 {
 
 NSLog(@"%s",__func__);
 }
 
 - (BOOL)textFieldShouldEndEditing:(UITextField *)textField
 {
 NSLog(@"%s",__func__);
 return YES;
 }
 */

#pragma mark - 检查手机号的输入信息
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //NSLog(@"%s",__func__);
    int length = 0;
    UIAlertView *altView = [[UIAlertView alloc]init];
    switch (textField.tag / 10) {
        case  3:
            textField = (UITextField *)[self.view viewWithTag:30];
            length = [textField.text length];
            //NSLog(@"%@",[textField.text substringToIndex:3]);
            if (length != 11 || ![[textField.text substringToIndex:3] isEqualToString:@"187"]) {
                [self builtAlertView:altView FromFirstLabel:(UILabel *)[self.view viewWithTag:31] andSecLabel:(UILabel *)[self.view viewWithTag:32]];
            }
            [textField resignFirstResponder];
            break;
        default:
            break;
    }
}


 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
 {

    //NSLog(@"%s",__func__);

    int length = 0;
    UIAlertView *altView = [[UIAlertView alloc]init];
    length = [textField.text length];
    switch (textField.tag / 10) {
      case 1:
            if (length > 10) {
            [self builtAlertView:altView FromFirstLabel:(UILabel *)[self.view viewWithTag:11] andSecLabel:(UILabel *)[self.view viewWithTag:12]];
                [textField resignFirstResponder];
            }
            break;
/*          case 2:
                textField = (UITextField *)[self.view viewWithTag:20];
                length = [textField.text length];
                NSLog(@"%@=====%d",textField.text,length);
                NSLog(@"%d",[textField.text isEqualToString:@"*qq.com"]);
                NSLog(@"%d",[textField.text hasSuffix:@"com"]);
                if ([textField.text isEqualToString:@"*qq.com"] || ![textField.text hasSuffix:@"com"]) {
                [self builtAlertView:altView FromFirstLabel:(UILabel *)[self.view viewWithTag:21] andSecLabel:(UILabel *)[self.view viewWithTag:22]];
                }
                break;
        case  3:
            textField = (UITextField *)[self.view viewWithTag:30];
            length = [textField.text length];
            if (length > 11) {
            [self builtAlertView:altView FromFirstLabel:(UILabel *)[self.view viewWithTag:31] andSecLabel:(UILabel *)[self.view viewWithTag:32]];
            }
            break;

        case  2:
            if (length >= 1) {
                if ([[textField.text substringFromIndex:length -1 ]  isEqualToString: @"&"]|| [[textField.text substringFromIndex:length -1 ] isEqualToString:@"#"]) {
                    [self builtAlertView:altView FromFirstLabel:(UILabel *)[self.view viewWithTag:21] andSecLabel:(UILabel *)[self.view viewWithTag:22]];
                }
            }
            break;
       case  5:
            textField = (UITextField *)[self.view viewWithTag:50];
            UITextField *textField2 = (UITextField *)[self.view viewWithTag:40];
            if ([textField.text isEqualToString:textField2.text]) {
            [self builtAlertView:altView FromFirstLabel:(UILabel *)[self.view viewWithTag:51] andSecLabel:(UILabel *)[self.view viewWithTag:52]];
            }
            break;
        //        default:
        //            break;
 */
    }
 
 return YES;
 }

/*
 - (BOOL)textFieldShouldClear:(UITextField *)textField
 {
 NSLog(@"%s",__func__);
 return YES;
 }
 */
#pragma mark - 检查username、emil、password及password确认的输入信息


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%s",__func__);
    int length = 0;
    length = [textField.text length];
    UIAlertView *altView = [[UIAlertView alloc]init];
    switch (textField.tag / 10) {
        case 1:
            /*
            //textField = (UITextField *)[self.view viewWithTag:10];
            //length = [textField.text length];
             */
            if (length > 10) {
                [self builtAlertView:altView FromFirstLabel:(UILabel *)[self.view viewWithTag:11] andSecLabel:(UILabel *)[self.view viewWithTag:12]];
            }
            [textField resignFirstResponder];
            break;
        case 2:
            /*
            //length = [textField.text length];
//            NSLog(@"length : %d",length);
//            NSLog(@"%@",textField.text);
             */
            if (length < 8 ||[[textField.text substringFromIndex:length - 6 ] isEqualToString:@"qq.com"] ||![textField.text hasSuffix:@"com"]) {
                [self builtAlertView:altView FromFirstLabel:(UILabel *)[self.view viewWithTag:21] andSecLabel:(UILabel *)[self.view viewWithTag:22]];
            }
            [textField resignFirstResponder];
            break;
        case  4:
            if (length < 8 || length > 12) {
                [self builtAlertView:altView FromFirstLabel:(UILabel *)[self.view viewWithTag:41] andSecLabel:(UILabel *)[self.view viewWithTag:42]];
            }
            [textField resignFirstResponder];
            break;
        case  5:
            textField = (UITextField *)[self.view viewWithTag:50];
            UITextField *textField2 = (UITextField *)[self.view viewWithTag:40];
            if (![textField.text isEqualToString:textField2.text]) {
                [self builtAlertView:altView FromFirstLabel:(UILabel *)[self.view viewWithTag:51] andSecLabel:(UILabel *)[self.view viewWithTag:52]];
            }
            [textField resignFirstResponder];
            break;
//        default:
//            break;
    }
    return YES;
}
/*
#pragma mark - 警告处理
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSArray *arrTag = [[NSArray alloc]initWithObjects:@100,@200,@300,@400,@500, nil];
    for (id tagIndex in arrTag) {
        NSInteger tag = [tagIndex integerValue];
        UITextField *textField = (UITextField *)[self.view viewWithTag:tag];
        switch (tag / 100) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                if (buttonIndex == 0) {
                    [textField resignFirstResponder];
                     }
                NSLog(@"============%d",buttonIndex);
                break;
            default:
                break;
        }
    }
}
*/
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
