//
//  AlertTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "AlertTableViewController.h"

@interface AlertTableViewController ()

@property(nonatomic,strong)NSArray *alertArray;
@property(nonatomic,strong)NSArray *alertViewStyleArray;

@end
/*
#define UIAlertViewStyleDefault                 0
#define UIAlertViewStyleSecureTextInput         1
#define UIAlertViewStylePlainTextInput          2
#define UIAlertViewStyleLoginAndPasswordInput   3
*/
static NSString *sectionTitle = @"sectionTitle";
static NSString *textLabel = @"textLabel";
static NSString *alertType = @"alertType";

@implementation AlertTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UIAlertView";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
#pragma mark 设置headerView
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"6"]];
    headerLabel.text = @"This AlertView show";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [UIColor greenColor];
    headerLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:30];
    self.tableView.tableHeaderView = headerLabel;
    
     _alertArray = @[
                    @{sectionTitle:@"UIAlertViewStyleDefault",
                      textLabel:@"please select the cell"},
                    @{sectionTitle:@"UIAlertViewStyleSecureTextInput",
                      textLabel:@"please select the cell"},
                    @{sectionTitle:@"UIAlertViewStylePlainTextInput",
                      textLabel:@"please select the cell"},
                    @{sectionTitle:@"UIAlertViewStyleLoginAndPasswordInput",
                      textLabel:@"please select the cell"}
                    ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _alertArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark cell 的创建及重用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _alertArray[indexPath.section][textLabel];
    return cell;
}
#pragma mark 设置headerView in section
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    headerLabel.text = _alertArray[section][sectionTitle];
    headerLabel.backgroundColor = [UIColor brownColor];
    return headerLabel;
}
#pragma mark 选中cell时触发事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"alertView" message:@"test" delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"OK", nil];
    alertView.message = _alertArray[indexPath.section][sectionTitle];
    alertView.alertViewStyle = indexPath.section;
    [alertView show];
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
