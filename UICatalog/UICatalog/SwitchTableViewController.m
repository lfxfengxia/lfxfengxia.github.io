//
//  SwitchTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-13.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "SwitchTableViewController.h"

@interface SwitchTableViewController ()

@property(nonatomic,strong)NSArray *switchArray;

@end

static NSString *sectionTitle = @"sectionTitle";
static NSString *labelText = @"labelText";
static NSString *switchType = @"switchType";

@implementation SwitchTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UISwitch";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
#pragma mark 设置tableHeaderView
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    headerLabel.text = @"uses of Slider";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4"]];
    headerLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:30];
    headerLabel.textColor = [UIColor cyanColor];
    self.tableView.tableHeaderView = headerLabel;
    
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4"]];
    
#pragma mark - 设置是switch type
    UISwitch *defaultSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(240, 5, 0, 0)];
    UISwitch *tintColorSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(240, 5, 0, 0)];
    tintColorSwitch.tintColor = [UIColor magentaColor];
    tintColorSwitch.onTintColor = [UIColor orangeColor];
    UISwitch *thumbSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(240, 5, 0, 0)];
    thumbSwitch.thumbTintColor = [UIColor cyanColor];
    
    UISwitch *imageSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(240, 5, 0, 0)];
    UIImage *img = [UIImage imageNamed:@"switch"];
    UIImage *stretchImg = [img resizableImageWithCapInsets:UIEdgeInsetsMake(15, 15, 15, 15) resizingMode:UIImageResizingModeStretch];
    imageSwitch.onImage = stretchImg;
    imageSwitch.offImage = stretchImg;
    _switchArray = @[
                     @{sectionTitle: @"switch Type",
                       labelText:@"default switch",
                       switchType:defaultSwitch},
                     @{sectionTitle: @"switch Type",
                       labelText:@"on/tintColor switch",
                       switchType:tintColorSwitch},
                     @{sectionTitle: @"switch Type",
                       labelText:@"thumbTintColor switch",
                       switchType:thumbSwitch},
                     @{sectionTitle: @"switch Type",
                       labelText:@"on & offImage switch",
                       switchType:imageSwitch}
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
    return _switchArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *identifier = @"UITableview";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
     if (cell == nil) {
     cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
     }
     cell.textLabel.text = _switchArray[indexPath.section][labelText];
     UISwitch *tmpSwitch = _switchArray[indexPath.section][switchType];
     [cell.contentView addSubview:tmpSwitch];
    [tmpSwitch addTarget:self action:@selector(clickSwitch:) forControlEvents:UIControlEventValueChanged];
    cell.backgroundColor = [UIColor clearColor];
     return cell;
}
#pragma mark 设置headerTitle
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _switchArray[section][sectionTitle];
}

#pragma mark 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark - 监听Switch的值变化
- (void)clickSwitch:(UISwitch *)sender
{
    if (sender.on) {
        self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3"]];
    }else{
        self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4"]];
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
