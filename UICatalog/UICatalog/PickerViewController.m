//
//  PickerViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-14.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UILabel *cityInfoLabel;

@end

#define kState   @"state"
#define kCities   @"cities"

@implementation PickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    _dataArray = [NSArray arrayWithContentsOfFile:path];
    
    UIPickerView * pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 70, 0, 0)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [self.view addSubview:pickerView];
    
    _cityInfoLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 400, CGRectGetWidth(self.view.bounds) - 20, 50)];
    //cityInfoLabel.backgroundColor = [UIColor grayColor];
    _cityInfoLabel.textColor = [UIColor blueColor];
    _cityInfoLabel.textAlignment = NSTextAlignmentCenter;
    _cityInfoLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:20];
    [self.view addSubview:_cityInfoLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return _dataArray.count;
    }else{
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        NSArray *cities = _dataArray[selectedRow][kCities];
        return cities.count;
    }
}

#pragma mark - 文字设置pickerView
/*
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return _dataArray[row][kState];
    }else{
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        NSArray *cities = _dataArray[selectedRow][kCities];
        return cities[row];
    }
}
*/
#pragma mark - UIView设置pickerView
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (component == 0) {
        UILabel *firstLabel = [[UILabel alloc]init];
        firstLabel.text = _dataArray[row][kState];
        firstLabel.textColor = [UIColor blueColor];
        firstLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:25];
        firstLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"QYVc.jpg"]];
        return firstLabel;
    }else{
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        NSArray *cities = _dataArray[selectedRow][kCities];
        UILabel *secLabel = [[UILabel alloc]init];
        secLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4"]];
        secLabel.text = cities[row];
        secLabel.font = [UIFont fontWithName:@"Savoye LET" size:25];
        secLabel.textColor = [UIColor greenColor];
        NSInteger selectedSecRow = [pickerView selectedRowInComponent:1];
        _cityInfoLabel.text = [NSString stringWithFormat:@"province : %@  city : %@",_dataArray[selectedRow][kState],_dataArray[selectedRow][kCities][selectedSecRow]];
        return secLabel;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
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
