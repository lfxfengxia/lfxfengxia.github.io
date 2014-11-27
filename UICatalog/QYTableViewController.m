//
//  QYTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYTableViewController.h"
#import "QYMainViewController.h"
#import "LabelTableViewController.h"
#import "ColorTableViewController.h"
#import "FontTableViewController.h"
#import "AlertTableViewController.h"
#import "ActionSheetTableViewController.h"
#import "ImageViewTableViewController.h"
#import "UIActivityTableViewController.h"
#import "PickerViewController.h"
#import "WebViewController.h"
#import "SearchBarViewController.h"

#define kName       @"name"
#define kDesc       @"desc"
#define kIcon       @"icon"
#define kNextView   @"nextView"

@interface QYTableViewController ()

@property(nonatomic,strong)NSArray *catdlogArray;

@end

@implementation QYTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UICatalog";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]init];
    backBarButtonItem.title = @"back";
    self.navigationItem.backBarButtonItem = backBarButtonItem;

    NSString *path = [[NSBundle mainBundle] pathForResource:@"catalog" ofType:@"plist"];
    _catdlogArray = [NSArray arrayWithContentsOfFile:path];
    
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"9"]];
    headerLabel.text = @"UI Catalog";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [UIColor blueColor];
    headerLabel.font = [UIFont fontWithName:@"Savoye LET" size:35];
    
    self.tableView.tableHeaderView = headerLabel;
    
//    NSLog(@"%@",NSClassFromString(_catdlogArray[0][kNextView]));
//    UIViewController *vc = [[NSClassFromString(_catdlogArray[0][kNextView]) init]alloc];
//    NSLog(@"%@",vc);
    
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"QYVc.jpg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
#pragma mark 确定rows的值
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _catdlogArray.count;
}

#pragma mark 定义cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    NSDictionary *dict = _catdlogArray[indexPath.row];
    NSString *imgName = dict[kIcon];
    cell.textLabel.text = dict[kName];
    cell.detailTextLabel.text = dict[kDesc];
    cell.imageView.image = [UIImage imageNamed:imgName];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor clearColor];
     return cell;
}

#pragma mark - 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
#pragma mark -  push到新界面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
/*    UIViewController *tmpVc = [[UIViewController alloc]init];
    
    QYMainViewController *controlVc = [[QYMainViewController alloc]init];
    LabelTableViewController *labelVc = [[LabelTableViewController alloc]init];
    ColorTableViewController *colorVc = [[ColorTableViewController alloc]init];
    FontTableViewController *fontVc = [[FontTableViewController alloc]init];
    AlertTableViewController *alertVc = [[AlertTableViewController alloc]init];
    ActionSheetTableViewController *actionSheetVc = [[ActionSheetTableViewController alloc]init];
    ImageViewTableViewController *imgVc = [[ImageViewTableViewController alloc]init];
    UIActivityTableViewController *activityVc = [[UIActivityTableViewController alloc]init];
    PickerViewController *pickerVc = [[PickerViewController alloc]init];
    WebViewController *webVc = [[WebViewController alloc]init];
    SearchBarViewController *searchVc = [[SearchBarViewController alloc]init];
    switch (indexPath.row) {
        case 0:
            tmpVc = controlVc;
            break;
        case 1:
            tmpVc = labelVc;
            break;
        case 2:
            tmpVc = colorVc;
            break;
        case 3:
            tmpVc = fontVc;
            break;
        case 4:
            tmpVc = alertVc;
            break;
        case 5:
            tmpVc = actionSheetVc;
            break;
        case 6:
            tmpVc = imgVc;
            break;
        case 7:
            tmpVc = activityVc;
            break;
        case 8:
            tmpVc = pickerVc;
            break;
        case 9:
            tmpVc = webVc;
            break;
        case 10:
            tmpVc = searchVc;
            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:tmpVc animated:YES];
*/

    NSString *className = _catdlogArray[indexPath.row][kNextView];
    UIViewController *viewController = [[NSClassFromString(className) alloc]init];
    NSLog(@"%@",viewController);
    
    [self.navigationController pushViewController:viewController animated:YES];
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
