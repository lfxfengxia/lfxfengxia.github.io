//
//  ActionSheetTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "ActionSheetTableViewController.h"

@interface ActionSheetTableViewController ()

@property(nonatomic,strong)NSArray *actionSheetArray;

@end

static NSString *sectionTitle = @"sectionTitle";
static NSString *textLabel = @"textLabel";
static NSString *alertType = @"actionSheetType";

@implementation ActionSheetTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UIActionSheet";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
#pragma mark 设置headerView
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"0"]];
    headerLabel.text = @"This ActionSheet show";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [UIColor greenColor];
    headerLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:30];
    
    self.tableView.tableHeaderView = headerLabel;
    /**
     *  UIActionSheetStyleAutomatic        = -1,       // take appearance from toolbar style otherwise uses 'default'
     UIActionSheetStyleDefault          = UIBarStyleDefault,
     UIActionSheetStyleBlackTranslucent = UIBarStyleBlackTranslucent,
     UIActionSheetStyleBlackOpaque
     */
    _actionSheetArray = @[
                    @{sectionTitle:@"UIActionSheetStyleAutomatic",
                      textLabel:@"please select the cell"},
                    @{sectionTitle:@"UIActionSheetStyleDefault",
                      textLabel:@"please select the cell"},
                    @{sectionTitle:@"UIActionSheetStyleBlackTranslucent",
                      textLabel:@"please select the cell"},
                    @{sectionTitle:@"UIActionSheetStyleBlackOpaque",
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
    return _actionSheetArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark cell的创建及重用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"please select the cell";
    return cell;
}
#pragma mark 设置headerTitle in section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _actionSheetArray[section][sectionTitle];
}
#pragma mark 设置选中cell时触发的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@" " delegate:self
cancelButtonTitle:@"cancle" destructiveButtonTitle:@"destructive" otherButtonTitles:@"OK", nil];
    actionSheet.title = _actionSheetArray[indexPath.section][sectionTitle];
    actionSheet.actionSheetStyle = indexPath.section;
    [actionSheet showInView:self.view];
}
#pragma mark 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
