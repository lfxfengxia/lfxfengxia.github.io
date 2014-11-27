//
//  UIActivityTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-13.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "UIActivityTableViewController.h"

@interface UIActivityTableViewController ()

@property(nonatomic,strong)NSArray *activityArray;

@end

static NSString *sectionTitle = @"sectionTitle";
static NSString *textLabel = @"textLabel";
static NSString *activityType = @"activityType";

@implementation UIActivityTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UIActivity";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#pragma mark 设置headerView
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"10"]];
    headerLabel.text = @"uses of UIActivityView ";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [UIColor magentaColor];
    headerLabel.font = [UIFont fontWithName:@"Avenir Next Condensed" size:25];
    
    self.tableView.tableHeaderView = headerLabel;
    
    UIActivityIndicatorView *defaultActivity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(130, 0, 60, 60)];
    
    UIActivityIndicatorView *whiteActivity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(130, 0, 60, 60)];
    whiteActivity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    
    UIActivityIndicatorView *grayActivity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(130, 0, 60, 60)];
    grayActivity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;

    UIActivityIndicatorView *colorActivity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(130, 0, 60, 60)];
    colorActivity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    colorActivity.color = [UIColor blueColor];
    _activityArray = @[
                       @{sectionTitle:@"activityIndictatorView type",
                         textLabel:@"white type",
                         activityType:defaultActivity},
                       @{sectionTitle:@"activityIndictatorView type",
                         textLabel:@"whiteLarge type",
                         activityType:whiteActivity},
                       @{sectionTitle:@"activityIndictatorView type",
                         textLabel:@"gray type",
                         activityType:grayActivity},
                       @{sectionTitle:@"activityIndictatorView type",
                         textLabel:@"type with blueColor at whiteStyle",
                         activityType:colorActivity}
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
    return _activityArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
#pragma mark cell的创建及重用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = _activityArray[indexPath.section][textLabel];
    }else{
        UIActivityIndicatorView * activityVc = _activityArray[indexPath.section][activityType];
        [cell.contentView  addSubview:activityVc];
        [activityVc startAnimating];
        cell.backgroundColor = [UIColor grayColor];
    }
    return cell;
}
#pragma mark 设置sectionHeaderTitle
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _activityArray[section][sectionTitle];
}

#pragma mark - 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row == 0 ? 44 : 60;
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
