//
//  QYViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-15.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYViewController.h"
#import "TransitionViewController.h"

@interface QYViewController ()

@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UILabel *styleLabel;

@end

@implementation QYViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Others";
    }
    return self;
}

- (void)loadView
{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Viewcontroller.jpg"]];
    imgView.userInteractionEnabled = YES;
    self.view = imgView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.tabBarController.hidesBottomBarWhenPushed = NO;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tabBarSystemItem" ofType:@"plist"];
    _dataArray = [NSArray arrayWithContentsOfFile:path];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"push_highlighted"] style:UIBarButtonItemStylePlain target:self action:@selector(pushNewView)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 100, 0, 0)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [self.view addSubview:pickerView];
    
    _styleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 320, 300, 60)];
    _styleLabel.textAlignment = NSTextAlignmentCenter;
    _styleLabel.font = [UIFont boldSystemFontOfSize:20];
    _styleLabel.numberOfLines = 2;
    _styleLabel.textColor = [UIColor greenColor];
    [self.view addSubview:_styleLabel];
    
    UISwitch *switchBtn = [[UISwitch alloc]initWithFrame:CGRectMake(120, 400, 0, 0)];
    switchBtn.onTintColor = [UIColor yellowColor];
    switchBtn.tintColor = [UIColor orangeColor];
    [switchBtn addTarget:self action:@selector(changeTabBarItemBackgroundWithSwitch:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switchBtn];

}
#pragma mark - UIPickerView data source
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _dataArray.count;
}
#pragma mark pickerView内容的填充
- (NSString * )pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _dataArray[row];
}
#pragma mark - pickerView选择时的变化
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _styleLabel.text = [NSString stringWithFormat:@"UITabBarSystemItem%@",_dataArray[row]];
    UIViewController *viewController = [self.tabBarController.viewControllers objectAtIndex:2];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:row tag:row + 1000];
    viewController.tabBarItem = tabBarItem;
}

#pragma mark - pushNewView
- (void)pushNewView
{
    TransitionViewController *transitionVc = [[TransitionViewController alloc]init];
    [self.navigationController pushViewController:transitionVc animated:YES];
}
#pragma mark - UISwitch的值变化操作
- (void)changeTabBarItemBackgroundWithSwitch:(UISwitch *)sender
{
    if (sender.on) {
        self.tabBarController.tabBar.backgroundImage = [UIImage imageNamed:@"tabBarItem"];
    }else{
        self.tabBarController.tabBar.backgroundImage = [UIImage imageNamed:@"tabBarItem2"];
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
