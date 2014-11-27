//
//  ImageViewTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "ImageViewTableViewController.h"

@interface ImageViewTableViewController ()

@property(nonatomic,strong)NSMutableArray *imgViewsArray;

@end

@implementation ImageViewTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"imageView";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *autoBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"animation" style:UIBarButtonItemStyleBordered target:self action:@selector(autochangePictures)];
    self.navigationItem.rightBarButtonItem = autoBarButtonItem;
#pragma mark 设置headerView
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"9"]];
    headerLabel.text = @"pictures skimmer";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [UIColor greenColor];
    headerLabel.font = [UIFont fontWithName:@"Cochin" size:30];
    
    self.tableView.tableHeaderView = headerLabel;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"imageView" ofType:@"plist"];
    NSArray *tmpArray = [NSArray arrayWithContentsOfFile:path];
    
    _imgViewsArray = [NSMutableArray array];
    for (NSString *imgName in tmpArray) {
        [_imgViewsArray addObject:imgName];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _imgViewsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark cell的创建及重用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    NSString *imgName = [NSString stringWithFormat:@"%d.jpg",indexPath.section + 51];
    //NSString *imgName = _imgViewsArray[indexPath.section];
    //NSLog(@"%@",imgName);
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName]];
    imgView.frame = CGRectMake(10, 20, 300, 350);
    imgView.tag = 1002;
    [cell.contentView addSubview:imgView];
    
    return cell;
}
#pragma mark 设置headerTitle
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _imgViewsArray[section];
}
#pragma mark 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 450;
}

#pragma mark - barButtonItem的触发事件 自动播放图片
- (void)autochangePictures
{
    UIImageView *imgView = (UIImageView *)[self.view viewWithTag:1002];
    NSMutableArray *imgArray = [NSMutableArray array];
    for (int i = 0; i < _imgViewsArray.count; i ++) {
        NSString *imgName = [NSString stringWithFormat:@"%d.jpg",i + 51];
        UIImage *img = [UIImage imageNamed:imgName];
        [imgArray addObject:img];
    }
    imgView.animationImages = imgArray;
    imgView.animationDuration = 0.5 * _imgViewsArray.count;
    imgView.animationRepeatCount = 2;
    [imgView startAnimating];
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
