//
//  CameraViewController.m
//  registerWeb
//
//  Created by qingyun on 14-11-4.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"相册";
    }
    return self;
}

- (void)loadView
{
    UIView *cameraView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    cameraView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"8.jpg"]];
    
    self.view = cameraView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#pragma mark - 设置toolbar barbuttonItem；
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(backToPhotoGraph)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(setFunc)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    UIBarButtonItem *helpBarItem = [[UIBarButtonItem alloc]initWithTitle:@"Help" style:UIBarButtonItemStyleDone target:self action:@selector(helpFunc)];
    UIBarButtonItem *infoBarItem = [[UIBarButtonItem alloc]initWithTitle:@"show info" style:UIBarButtonItemStyleDone target:self action:@selector(showInformationOfPhotos)];
    infoBarItem.width = 360;
    NSArray *items = [[NSArray alloc]initWithObjects:helpBarItem,infoBarItem, nil];
    [self setToolbarItems:items];

#pragma mark - 添加slider
    UISlider *changePhotoSlider = [[UISlider alloc]init];
    [self buildView:changePhotoSlider atX:0 y:500 width:[UIScreen mainScreen].bounds.size.width - 65 hight:10 setTag:100];
    [self buildSlider:changePhotoSlider setMinValue:1 andMaxValue:50];
    
#pragma mark - 添加label标志第几张图片
    UILabel *labelNum = [[UILabel alloc]init];
    [self buildView:labelNum atX:110 y:80 width:110 hight:30 setTag:200];
    [self buildLabel:labelNum setText:@"1"];
    
#pragma mark - 添加label显示slider的进度率
    UILabel *labelRate = [[UILabel alloc]init];
    [self buildView:labelRate atX:[UIScreen mainScreen].bounds.size.width - 65 y:495 width:50 hight:15 setTag:210];
    [self buildLabel:labelRate setText:[NSString stringWithFormat:@"%.f%%",1 / changePhotoSlider.maximumValue * 100]];
    
#pragma mark - 初始化显示的图片为第一张图片
    UIImageView *imagView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photoBackGround.jpg"]];
    [self buildView:imagView atX:0 y:120 width:[UIScreen mainScreen].bounds.size.width hight:300 setTag:300];
    
#pragma mark - 添加button显示照片的详细描述信息
    UILabel *infoLabel = [[UILabel alloc]init];
    [self buildView:infoLabel atX:120 y:450 width:80 hight:40 setTag:400];
    [self buildLabel:infoLabel setText:@"There many photos ,and the photos is very beatiful !"];
}

#pragma mark - 创建视图的方法
- (void)buildView:(UIView *)view atX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width hight:(CGFloat)hight setTag:(NSUInteger)tag
{
    view.frame = CGRectMake(x, y, width, hight);
    view.tag = tag;
    [self.view addSubview:view];
}

#pragma mark - 创建UILabel的方法
- (void)buildLabel:(UILabel *)label setText:(NSString *)textInfo
{
    label.text = textInfo;
    label.textColor = [UIColor greenColor];
    label.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - 创建UISlider的方法
- (void)buildSlider:(UISlider *)slider setMinValue:(float)minValue andMaxValue:(float)MaxValue
{
    slider.minimumValue = minValue;
    slider.maximumValue = MaxValue;
    
    slider.minimumTrackTintColor = [UIColor greenColor];
    slider.maximumTrackTintColor = [UIColor blueColor];
    slider.thumbTintColor = [UIColor orangeColor];
    
    [slider addTarget:self action:@selector(trackSlider:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark -  设置helpFunc的方法
- (void)helpFunc
{
    UISlider *slider = (UISlider *)[self.view viewWithTag:100];
    int numberOfPhotos = slider.maximumValue;
    UIActionSheet *alertPhotoTotalNum = [[UIActionSheet alloc]initWithTitle:[NSString stringWithFormat:@"There are %d photos toatlly !",numberOfPhotos] delegate:self cancelButtonTitle:@"cancle" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    [alertPhotoTotalNum showInView:self.view];
}
#pragma mark - 设置setFunc方法
- (void)setFunc
{
    UIAlertView *alertViewToSetSomething = [[UIAlertView alloc]initWithTitle:@"夜间模式切换" message:@"改变图片的背景颜色" delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"ok", nil];
    [alertViewToSetSomething show];
}

#pragma mark - 返回相册
- (void)backToPhotoGraph
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 设置slider的滑动时图片的变化
- (void)trackSlider:(UISlider *)sender
{
    UILabel *firstLabel = (UILabel *)[self.view viewWithTag:200];
    UILabel *secLabel = (UILabel *)[self.view viewWithTag:210];
    UIImageView *imgView = (UIImageView *)[self.view viewWithTag:300];
    
    firstLabel.text = [NSString stringWithFormat:@"%.f",sender.value];
    secLabel.text = [NSString stringWithFormat:@"%.f%%",(sender.value / sender.maximumValue) * 100];
    
    NSString *imgName = [NSString stringWithFormat:@"%.f.jpg",sender.value ];
    imgView.image = [UIImage imageNamed:imgName];
    
    [self.view addSubview:imgView];
}

#pragma mark - 设置infoBtn的点击触发事件
- (void)showInformationOfPhotos
{
    UILabel *infoLabel = (UILabel *)[self.view viewWithTag:400];
    UIAlertView *infoAlertView = [[UIAlertView alloc]initWithTitle:@"photos' specific infomation" message:[NSString stringWithFormat:@"%@",infoLabel.text] delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:nil, nil];
    [infoAlertView show];
}

#pragma mark - alerView  delegate的实现
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%d",buttonIndex);
    if ((buttonIndex == 1 && self.view.backgroundColor == [UIColor grayColor])||(buttonIndex == 0 && self.view.backgroundColor != [UIColor grayColor])) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"8.jpg"]];
    }else{
        self.view.backgroundColor = [UIColor grayColor];
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
