//
//  ColorTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "ColorTableViewController.h"

@interface ColorTableViewController ()

@property(nonatomic,strong)NSArray *colorArray;

@end

@implementation ColorTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UIColor";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _colorArray = @[@"redColor",@"orangeColor",@"yellowColor",@"greenColor",@"blueColor",@"cyanColor",@"purpleColor",@"magentaColor",@"brownColor",@"blackColor",@"darkGrayColor",@"lightGrayColor",@"lightTextColor",@"whiteColor",@"grayColor",@"clearColor"];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cellColor"]];
#pragma mark 设置headerView
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"59.jpg"]];
    headerLabel.text = @"different colors show";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [UIColor cyanColor];
    headerLabel.font = [UIFont fontWithName:@"Marker Felt" size:30];
    
    self.tableView.tableHeaderView = headerLabel;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
#pragma mark 设置section的值
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark 设置rows的值
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _colorArray.count;
}
#pragma mark 创建cell及cell的重用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = _colorArray[indexPath.row];
    [self setTextcolorForCell:cell atRow:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
#pragma mark - 自定义方法 设置cell.textLabel.textColor
- (void)setTextcolorForCell:(UITableViewCell *)cell atRow:(NSInteger)row
{
    switch (row) {
        case 0:
            cell.textLabel.textColor = [UIColor redColor];
            break;
        case 1:
            cell.textLabel.textColor = [UIColor orangeColor];
            break;
        case 2:
            cell.textLabel.textColor = [UIColor yellowColor];
            break;
        case 3:
            cell.textLabel.textColor = [UIColor greenColor];
            break;
        case 4:
            cell.textLabel.textColor = [UIColor blueColor];
            break;
        case 5:
            cell.textLabel.textColor = [UIColor cyanColor];
            break;
        case 6:
            cell.textLabel.textColor = [UIColor purpleColor];
            break;
        case 7:
            cell.textLabel.textColor = [UIColor magentaColor];
            break;
        case 8:
            cell.textLabel.textColor = [UIColor brownColor];
            break;
        case 9:
            cell.textLabel.textColor = [UIColor blackColor];
            break;
        case 10:
            cell.textLabel.textColor = [UIColor darkGrayColor];
            break;
        case 11:
            cell.textLabel.textColor = [UIColor lightGrayColor];
            break;
        case 12:
            cell.textLabel.textColor = [UIColor lightTextColor];
            break;
        case 13:
            cell.textLabel.textColor = [UIColor whiteColor];
            break;
        case 14:
            cell.textLabel.textColor = [UIColor grayColor];
            break;
        case 15:
            cell.textLabel.textColor = [UIColor clearColor];
            break;
            
        default:
            break;
    }
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
