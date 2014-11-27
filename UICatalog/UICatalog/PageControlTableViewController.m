//
//  PageControlTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "PageControlTableViewController.h"

@interface PageControlTableViewController ()

@property(nonatomic,strong)NSArray *pagrArray;

@end

static NSString *sectionTitle = @"sectionTitle";
static NSString *labelText = @"labelText";
static NSString *pageControlType = @"pageControlType";

@implementation PageControlTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UIPageControl";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
#pragma mark 设置tableHeaderView
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    headerLabel.text = @"uses of pageControl";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4"]];
    headerLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:30];
    headerLabel.textColor = [UIColor cyanColor];
    self.tableView.tableHeaderView = headerLabel;
#pragma mark 设置pageControl type
    UIPageControl *defaultPageControl = [[UIPageControl alloc]init];
    [self bulidSlider:defaultPageControl];
    
    UIPageControl *noHideSinglePageControl = [[UIPageControl alloc]init];
    noHideSinglePageControl.hidesForSinglePage = NO;
    [self bulidSlider:noHideSinglePageControl];
    
    UIPageControl *tintColorPageControl = [[UIPageControl alloc]init];
    tintColorPageControl.currentPageIndicatorTintColor = [UIColor cyanColor];
    tintColorPageControl.hidesForSinglePage = YES;
    [self bulidSlider:tintColorPageControl];
    _pagrArray = @[
                     @{sectionTitle: @"pageControl type",
                       labelText:@"default pageControl",
                       pageControlType:defaultPageControl},
                     @{sectionTitle: @"pageControl type",
                       labelText:@"hide single pageControl",
                       pageControlType:noHideSinglePageControl},
                     @{sectionTitle: @"pageControl type",
                       labelText:@"tintColor pageControl",
                       pageControlType:tintColorPageControl}
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
    
    return _pagrArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

#pragma mark - cell的创建及重用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableview";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = _pagrArray[indexPath.section][labelText];
    UIPageControl *tmpPageControl = _pagrArray[indexPath.section][pageControlType];
    [cell.contentView addSubview:tmpPageControl];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _pagrArray[section][sectionTitle];
}
#pragma mark - 自定义方法
#pragma mark 创建pagecontrol
- (void)bulidSlider:(UIPageControl *)pageControl
{
    pageControl.frame = CGRectMake(170, 2, 140, 40);
    pageControl.numberOfPages = 6;
    pageControl.pageIndicatorTintColor = [UIColor magentaColor];
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
