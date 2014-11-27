//
//  LabelTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "LabelTableViewController.h"

@interface LabelTableViewController ()

@property(nonatomic,strong)NSArray *labelArray;

@end

static NSString *sectionTitle = @"sectionTitle";
static NSString *labelText = @"labelText";
static NSString *labelType = @"labelType";

static NSInteger viewTag = 1010;
@implementation LabelTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UILabel";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
#pragma mark 设置headerView
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"9"]];
    headerLabel.text = @"uses of UILabel";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [UIColor blueColor];
    headerLabel.font = [UIFont fontWithName:@"Menlo" size:30];
    self.tableView.tableHeaderView = headerLabel;
    
    UILabel *defaultLabel = [[UILabel alloc]init];
    [self bulidLable:defaultLabel];
    
    UILabel *adjustLabel = [[UILabel alloc]init];
    adjustLabel.adjustsFontSizeToFitWidth = YES;
    [self bulidLable:adjustLabel];
    
    UILabel *linesLabel = [[UILabel alloc]init];
    linesLabel.numberOfLines = 2;
    linesLabel.textAlignment = NSTextAlignmentCenter;
    [self bulidLable:linesLabel];
    
    UILabel *shadowLabel = [[UILabel alloc]init];
    shadowLabel.shadowColor = [UIColor greenColor];
    shadowLabel.shadowOffset = CGSizeMake(2, 2);
    [self bulidLable:shadowLabel];
    /**
     NSLineBreakByWordWrapping = 0,
    NSLineBreakByCharWrapping,
    NSLineBreakByClipping,
    NSLineBreakByTruncatingHead,
    NSLineBreakByTruncatingTail,
    NSLineBreakByTruncatingMiddle
     */
    UILabel *lineBreakCharLabel = [[UILabel alloc]init];
    lineBreakCharLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self bulidLable:lineBreakCharLabel];
    
    UILabel *lineBreakMiddleLabel = [[UILabel alloc]init];
    lineBreakMiddleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    [self bulidLable:lineBreakMiddleLabel];
    
    UILabel *lineBreakClippingLabel = [[UILabel alloc]init];
    lineBreakClippingLabel.lineBreakMode = NSLineBreakByClipping;
    [self bulidLable:lineBreakClippingLabel];
    
    UILabel *highLightedLabel = [[UILabel alloc]init];
    highLightedLabel.highlightedTextColor = [UIColor yellowColor];
    highLightedLabel.highlighted = YES;
    [self bulidLable:highLightedLabel];
    
    UILabel *fontLabel = [[UILabel alloc]init];
    fontLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:20];
    [self bulidLable:fontLabel];
    
    UILabel *minScaleLabel = [[UILabel alloc]init];
    minScaleLabel.minimumScaleFactor = 2;
    minScaleLabel.adjustsFontSizeToFitWidth = YES;
    [self bulidLable:minScaleLabel];
    
    UILabel *userEnableLabel = [[UILabel alloc]init];
    userEnableLabel.userInteractionEnabled = NO;
    UIButton *labelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [labelBtn setTitle:@"button" forState:UIControlStateNormal];
    labelBtn.backgroundColor = [UIColor redColor];
    labelBtn.frame = CGRectMake(110, 10, 50, 40);
    [userEnableLabel addSubview:labelBtn];
    [self bulidLable:userEnableLabel];
    
    _labelArray = @[
                    @{sectionTitle:@"label Type",
                      labelText:@"default label",
                      labelType:defaultLabel},
                    @{sectionTitle:@"label Type",
                      labelText:@"adjust label",
                      labelType:adjustLabel},
                    @{sectionTitle:@"label Type",
                      labelText:@"lines center label",
                      labelType:linesLabel},
                    @{sectionTitle:@"label Type",
                      labelText:@"shadow label",
                      labelType:shadowLabel},
                    @{sectionTitle:@"label Type",
                      labelText:@"lineBreak char label",
                      labelType:lineBreakCharLabel},
                    @{sectionTitle:@"label Type",
                      labelText:@"lineBreak middle label",
                      labelType:lineBreakMiddleLabel},
                    @{sectionTitle:@"label Type",
                      labelText:@"lineBreak clipping label",
                      labelType:lineBreakClippingLabel},
                    @{sectionTitle:@"label Type",
                      labelText:@"highLighted label",
                      labelType:highLightedLabel},
                    @{sectionTitle:@"label Type",
                      labelText:@"Snell Roundhand font label",
                      labelType:fontLabel},
                    @{sectionTitle:@"label Type",
                      labelText:@"minScale label",
                      labelType:minScaleLabel},
                    @{sectionTitle:@"label Type",
                      labelText:@"userInteractionEnable = NO label",
                      labelType:userEnableLabel}
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
    
    return _labelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}

#pragma mark cell的创建及重用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
/*    if (indexPath.row == 0) {
        static NSString *identifier = @"UITableViewCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        }
        cell.textLabel.text = _labelArray[indexPath.section][labelText];
        cell.textLabel.textColor = [UIColor greenColor];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"8"]];
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        UILabel *tmpLabel = _labelArray[indexPath.section][labelType];
        [cell.contentView addSubview:tmpLabel];
        return cell;
    }
*/
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    UIView *removeView = [cell.contentView viewWithTag:viewTag];
    if (removeView != nil) {
        [removeView removeFromSuperview];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = _labelArray[indexPath.section][labelText];
        cell.textLabel.textColor = [UIColor greenColor];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"8"]];
    }else{
        UILabel *tmpLabel = _labelArray[indexPath.section][labelType];
        [cell.contentView addSubview:tmpLabel];
    }
    return cell;
}
#pragma mark 设置headerTitle
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _labelArray[section][sectionTitle];
}
#pragma mark 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 44;
    }else{
        return 60;
    }
}
#pragma mark 设置选择后灰色消失
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //选择后两秒灰色消失
    [tableView performSelector:@selector(deselectRowAtIndexPath:animated:) withObject:indexPath afterDelay:0.5];
    
}
#pragma mark - 自定义方法
#pragma mark 创建label
- (void)bulidLable:(UILabel *)label
{
    label.frame = CGRectMake(80, 0, 160, 60);
    label.tag = viewTag;
    label.backgroundColor = [UIColor brownColor];
    label.text = @"a example of UILabel !";
    label.textColor = [UIColor blueColor];
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
