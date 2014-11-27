//
//  SegmentedControlTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "SegmentedControlTableViewController.h"

@interface SegmentedControlTableViewController ()

@property(nonatomic,strong)NSArray *segmentedArray;

@end

static NSString *sectionTitle = @"sectionTitle";
static NSString *labelText = @"labelText";
static NSString *segmentedType = @"segmentedType";

static NSInteger viewTag = 1010;

@implementation SegmentedControlTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UISegmetedContrl";
    }
    return self;
}

static NSString *kFirstIdentifier = @"kFirstIdentifier";
static NSString *kSecondIdentifier = @"kSecondIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
#pragma mark 设置tableHeaderView
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    headerLabel.text = @"uses of segmentedControl";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4"]];
    headerLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:30];
    headerLabel.textColor = [UIColor cyanColor];
    self.tableView.tableHeaderView = headerLabel;
    
    NSArray *arr = @[@"A",@"B",@"C",@"D"];
    UISegmentedControl *defaultSegmentedControl = [[UISegmentedControl alloc]initWithItems:arr];
    [self bulidSegmented:defaultSegmentedControl];
    
    UISegmentedControl *tintColorSegmentedControl = [[UISegmentedControl alloc]initWithItems:arr];
    tintColorSegmentedControl.tintColor = [UIColor orangeColor];
    [self bulidSegmented:tintColorSegmentedControl];
    
    UISegmentedControl *imageSegmentedControl = [[UISegmentedControl alloc]initWithItems:arr];
    [imageSegmentedControl insertSegmentWithImage:[UIImage imageNamed:@"smile"] atIndex:1 animated:YES];
    [imageSegmentedControl setImage:[UIImage imageNamed:@"smile_gray"] forSegmentAtIndex:3];
    [self bulidSegmented:imageSegmentedControl];
    
    UISegmentedControl *titleSegmentedControl = [[UISegmentedControl alloc]initWithItems:arr];
    [titleSegmentedControl setTitle:@"hello" forSegmentAtIndex:2];
    [self bulidSegmented:titleSegmentedControl];
    
    UISegmentedControl *widthSegmentedControl = [[UISegmentedControl alloc]initWithItems:arr];
    [widthSegmentedControl setWidth:100 forSegmentAtIndex:1];
    [self bulidSegmented:widthSegmentedControl];
    
    UISegmentedControl *offsetSegmentedControl = [[UISegmentedControl alloc]initWithItems:arr];
    [offsetSegmentedControl setContentOffset:CGSizeMake(3.0, 1.0) forSegmentAtIndex:3];
    [self bulidSegmented:offsetSegmentedControl];
    
    UISegmentedControl *enableSegmentedControl = [[UISegmentedControl alloc]initWithItems:arr];
    [enableSegmentedControl setEnabled:NO forSegmentAtIndex:2];
    [self bulidSegmented:enableSegmentedControl];
    
    UISegmentedControl *backgroundImageSegmentedControl = [[UISegmentedControl alloc]initWithItems:arr];
    [backgroundImageSegmentedControl setBackgroundImage:[UIImage imageNamed:@"segmentedBackground"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self bulidSegmented:backgroundImageSegmentedControl];
    _segmentedArray = @[
                   @{sectionTitle: @"segmentedControl type",
                     labelText:@"default segmentedCtrl",
                     segmentedType:defaultSegmentedControl},
                   @{sectionTitle: @"segmentedControl type",
                     labelText:@"tintColor segmentedCtrl",
                     segmentedType:tintColorSegmentedControl},
                   @{sectionTitle: @"segmentedControl type",
                     labelText:@"insert & set image segmentedCtrl",
                     segmentedType:imageSegmentedControl},
                   @{sectionTitle: @"segmentedControl type",
                     labelText:@"insert title segmentedCtrl",
                     segmentedType:titleSegmentedControl},
                   @{sectionTitle: @"segmentedControl type",
                     labelText:@"set width segmentedCtrl",
                     segmentedType:widthSegmentedControl},
                   @{sectionTitle: @"segmentedControl type",
                     labelText:@"content offset segmentedCtrl",
                     segmentedType:offsetSegmentedControl},
                   @{sectionTitle: @"segmentedControl type",
                     labelText:@"some btn noenable segmentedCtrl",
                     segmentedType:enableSegmentedControl},
                   @{sectionTitle: @"segmentedControl type",
                     labelText:@"background with image segmentedCtrl",
                     segmentedType:backgroundImageSegmentedControl}
                   ];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kFirstIdentifier];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSecondIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _segmentedArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}

#pragma mark - 利用标志解决cell的重用问题
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
/*    if (indexPath.row == 0) {
        static NSString *identifier = @"UITableview";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        }
        cell.textLabel.text = _segmentedArray[indexPath.section][labelText];
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        UISegmentedControl *tmpSegmentedControl = _segmentedArray[indexPath.section][segmentedType];
        [cell.contentView addSubview:tmpSegmentedControl];
        return cell;
    }
 */
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFirstIdentifier];
        cell.textLabel.text = _segmentedArray[indexPath.section][labelText];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSecondIdentifier];
        UIView *removeView = [cell.contentView viewWithTag:viewTag];
        if (removeView != nil) {
            [removeView removeFromSuperview];
        }
        UISegmentedControl *tmpSegmentedControl = _segmentedArray[indexPath.section][segmentedType];
        [cell.contentView addSubview:tmpSegmentedControl];
        return cell;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _segmentedArray[section][sectionTitle];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 44;
    }else{
        return 60;
    }
}
#pragma mark - 自定义方法
#pragma mark 创建slider
- (void)bulidSegmented:(UISegmentedControl *)segmentedControl
{
    segmentedControl.frame = CGRectMake(20, 2, 280, 40);
    segmentedControl.tag = viewTag;
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
