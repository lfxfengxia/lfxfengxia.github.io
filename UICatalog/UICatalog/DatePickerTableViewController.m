//
//  DatePickerTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-14.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "DatePickerTableViewController.h"

@interface DatePickerTableViewController ()

{
    UISegmentedControl *_segmetedCtrl;
    UIDatePicker *_datePicker;
}

@end

@implementation DatePickerTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#pragma mark 设置tableHeaderView
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    headerLabel.text = @"uses of datePicker";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4"]];
    headerLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:30];
    headerLabel.textColor = [UIColor cyanColor];
    self.tableView.tableHeaderView = headerLabel;
    
    _datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(10, 50, 300, 300)];
    _datePicker.locale = [NSLocale systemLocale];
    _datePicker.timeZone = [NSTimeZone localTimeZone];
    
    NSArray *items = @[@"Time",@"Date",@"Date&Time",@"CountDownTimer"];
    _segmetedCtrl = [[UISegmentedControl alloc]initWithItems:items];
    [_segmetedCtrl setWidth:40 forSegmentAtIndex:0];
    [_segmetedCtrl setWidth:40 forSegmentAtIndex:1];
    _segmetedCtrl.frame = CGRectMake(0, 400, 320, 40);
    _segmetedCtrl.backgroundColor = [UIColor grayColor];
    _segmetedCtrl.tintColor = [UIColor greenColor];
    
    [_segmetedCtrl addTarget:self action:@selector(changDatePickerMode:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:_segmetedCtrl];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"datePicker.jpg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        [cell.contentView  addSubview:_datePicker];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"timerZone : %@",_datePicker.timeZone];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = [UIColor blueColor];
        cell.textLabel.numberOfLines = 2;
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"datePicker";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row == 0 ? 300 : 60;
}

#pragma mark - 自定义控制datePicker mode的方法
- (void)changDatePickerMode:(UISegmentedControl *)segmentedCtrl
{
    switch (segmentedCtrl.selectedSegmentIndex) {
        case 0:
            _datePicker.datePickerMode = UIDatePickerModeTime;
            _datePicker.backgroundColor = [UIColor brownColor];
            break;
        case 1:
            _datePicker.datePickerMode = UIDatePickerModeDate;
            _datePicker.backgroundColor = [UIColor greenColor];
            break;
        case 2:
            _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
            _datePicker.backgroundColor = [UIColor yellowColor];
            break;
        case 3:
            _datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
            _datePicker.backgroundColor = [UIColor lightGrayColor];
            break;
        default:
            break;
    }
    //[self.tableView addSubview:_datePicker];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
