//
//  QYMainViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYMainViewController.h"
#import "ButtonTableViewController.h"
#import "SliderTableViewController.h"
#import "PageControlTableViewController.h"
#import "SegmentedControlTableViewController.h"
#import "TextFieldTableViewController.h"
#import "SwitchTableViewController.h"
#import "DatePickerTableViewController.h"

#define kName       @"name"
#define kDesc       @"desc"
#define kNextView   @"nextview"

@interface QYMainViewController ()

@property(nonatomic,strong)NSArray *controlsArray;

@end

@implementation QYMainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UIControls";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]init];
    backBarButtonItem.title = @"back";
    self.navigationItem.backBarButtonItem = backBarButtonItem;
    
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mainVc.jpg"]];
    headerLabel.text = @"different controls show";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [UIColor cyanColor];
    headerLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:25];
    
    self.tableView.tableHeaderView = headerLabel;
    
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"57.jpg"]];
//    NSString *controlPath = [[NSBundle mainBundle] pathForResource:@"controls" ofType:@"plist"];
//    _controlsArray = [NSArray arrayWithContentsOfFile:controlPath];

//    ButtonTableViewController *buttonVc = [[ButtonTableViewController alloc]init];
//    SliderTableViewController *sliderVc = [[SliderTableViewController alloc]init];
//    SwitchTableViewController *switchVc = [[SwitchTableViewController alloc]init];
//    TextFieldTableViewController *textFieldVc = [[TextFieldTableViewController alloc]init];
//    PageControlTableViewController *pageVc = [[PageControlTableViewController alloc]init];
//    SegmentedControlTableViewController *segmentedVc = [[SegmentedControlTableViewController alloc]init];
//    DatePickerTableViewController *datePickerVc = [[DatePickerTableViewController alloc]init];
    _controlsArray = @[
                       @{kName:@"UIButton",
                         kDesc:@"uses of button",
                         kNextView:@"ButtonTableViewController"},
                       @{kName:@"UISlider",
                         kDesc:@"uses of slider",
                         kNextView:@"SliderTableViewController"},
                       @{kName: @"UISwitch",
                         kDesc:@"uses of switch",
                         kNextView:@"SwitchTableViewController"},
                       @{kName:@"UITextField",
                         kDesc:@"uses of textField",
                         kNextView:@"TextFieldTableViewController"},
                       @{kName:@"UIPageControl",
                         kDesc:@"uses of pageControl",
                         kNextView:@"PageControlTableViewController"},
                       @{kName: @"PageControlTableViewController",
                         kDesc:@"uses of segmentedContrl",
                         kNextView:@"SegmentedControlTableViewController"},
                       @{kName: @"UIDatePicker",
                         kDesc:@"uses of datePicker",
                         kNextView:@"DatePickerTableViewController"}
                       ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
#pragma mark  确定rows的值
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _controlsArray.count;
}

#pragma mark 定义cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UIMainTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = _controlsArray[indexPath.row][kName];
    cell.detailTextLabel.text = _controlsArray[indexPath.row][kDesc];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSString *imgName = [NSString stringWithFormat:@"%d.jpg",indexPath.row + 21];
    cell.imageView.image = [UIImage imageNamed:imgName];
    cell.backgroundColor = [UIColor clearColor];
    cell.tintColor = [UIColor blueColor];
    return cell;
}

#pragma mark - push到新界面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
#if 0
    UIViewController *tmpVc = _controlsArray[indexPath.row][kNextView];
    
    [self.navigationController pushViewController:tmpVc animated:YES];
#else
    NSString *className = _controlsArray[indexPath.row][kNextView];
    UIViewController *tmpVc = [[NSClassFromString(className) alloc]init];
    [self.navigationController pushViewController:tmpVc animated:YES];
#endif
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
