//
//  AddressBookViewControllerTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-15.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "QYChild.h"

@interface ContactsTableViewController ()

@property(nonatomic,strong)NSMutableArray *childrenArry;
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UIAlertView *modifyChanceAlertView;
@property(nonatomic,strong)UIAlertView *modifyNameAlertView;
@property(nonatomic,strong)UIAlertView *modifyPhoneNumAlertView;
@property(nonatomic,assign)NSIndexPath *indexPath;
@property(nonatomic,assign)NSInteger num;

@end

static NSString *kDifferentIdentifier = @"differentIdentifier";
static NSString *kIdentifier = @"identifier";

@implementation ContactsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Contacts";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 60)];
    headerLabel.text = @"Adorable Baby";
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Viewcontroller.jpg"]];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    self.tableView.tableHeaderView = headerLabel;
    self.tableView.tableHeaderView.frame = CGRectMake(0, 60, 320, 60);
    
    UIBarButtonItem *isHideBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(isHidentabBarWith)];
    self.navigationItem.leftBarButtonItem = isHideBarButtonItem;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
/*
//    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 20, 320, 40)];
//    toolBar.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:toolBar];
//    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"cancle" style:UIBarButtonItemStyleBordered target:self action:@selector(isHidentabBarWith:)];
//    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
*/
    NSString *path = [[NSBundle mainBundle] pathForResource:@"contacter" ofType:@"plist"];
    _childrenArry = [NSMutableArray
                     arrayWithContentsOfFile:path];
    
    _modifyChanceAlertView = [[UIAlertView alloc]initWithTitle:@"Please chance" message:@"modify name or phone number" delegate:self cancelButtonTitle:@"name" otherButtonTitles:@"phone number", nil];
    _modifyNameAlertView = [[UIAlertView alloc]initWithTitle:@"modify name" message:@"Please input new name" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    _modifyNameAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    _modifyPhoneNumAlertView = [[UIAlertView alloc]initWithTitle:@"modify phone number" message:@"Please input new phone number" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    _modifyPhoneNumAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"addressBook.jpg"]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kDifferentIdentifier];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _childrenArry.count;
}

#pragma mark cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
/*    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDifferentIdentifier forIndexPath:indexPath];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(260, 17, 30, 30);
        //    UIImage *grayImg = [UIImage imageNamed:@"btn_background"];
        //    UIImage *newGrayImg = [grayImg resizableImageWithCapInsets:UIEdgeInsetsMake(5, 14, 5, 14) resizingMode:UIImageResizingModeStretch];
        [button setImage:[UIImage imageNamed:@"hideTabBar"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"showTabBar"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(isHidentabBarWith:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.contentView addSubview:button];
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier forIndexPath:indexPath];
#pragma mark 面型对象的方法给cell的属性赋值
        QYChild *child = [QYChild childWithDictionary:_childrenArry[indexPath.row - 1]];
        cell.textLabel.text = child.name;
        cell.detailTextLabel.text = child.phoneNum;
        NSString *imgName = [NSString stringWithFormat:@"%@",child.portrait];
#pragma mark 直接用数组的内容给cell的属性赋值
//        cell.textLabel.text = _childrenArry[indexPath.row][kName];
//        cell.detailTextLabel.text = _childrenArry[indexPath.row][kPhoneNum];
//        NSString *imgName = [NSString stringWithFormat:@"%@",_childrenArry[indexPath.row][kPortrait]];
        
        cell.imageView.image = [UIImage imageNamed:imgName];
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
*/
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
#pragma mark 面型对象的方法给cell的属性赋值
    QYChild *child = [QYChild childWithDictionary:_childrenArry[indexPath.row]];
    cell.textLabel.text = child.name;
    cell.detailTextLabel.text = child.phoneNum;
    NSString *imgName = [NSString stringWithFormat:@"%@",child.portrait];
    cell.imageView.image = [UIImage imageNamed:imgName];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.backgroundColor = [UIColor clearColor];
    
    UIButton *cellBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cellBtn.frame = CGRectMake(270, 10, 40, 40);
    [cellBtn setImage:[UIImage imageNamed:@"cellBtn"] forState:UIControlStateNormal];
    [cellBtn setImage:[UIImage imageNamed:@"cellBtn_highlighted"] forState:UIControlStateHighlighted];
    [cellBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    cellBtn.tag = indexPath.row + 1000;
    [cell.contentView addSubview:cellBtn];
    return cell;
}

#pragma mark 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark - 设置tabBar是否隐藏
- (void)isHidentabBarWith
{
    if (self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = NO;
    }else{
        self.tabBarController.tabBar.hidden = YES;
    }
}

#pragma mark - 监听cellBtn的点击事件
- (void)clickButton:(UIButton *)sender
{
//    _indexPath = [NSIndexPath indexPathForRow:sender.tag - 1000 inSection:0];
//    NSLog(@"%d",_indexPath.row);
    _num = sender.tag - 1000;
    [_modifyChanceAlertView show];
}

#pragma mark - UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == _modifyChanceAlertView) {
        if (buttonIndex == 0) {
            [_modifyNameAlertView show];
        }else{
            [_modifyPhoneNumAlertView show];
        }
    }else if(alertView == _modifyNameAlertView){        if (buttonIndex == 1) {
            UITextField *nameText = [_modifyNameAlertView textFieldAtIndex:0];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_num inSection:0];
            NSDictionary *willReplaceDict = [_childrenArry objectAtIndex:_num];
            NSDictionary *addDict = [NSDictionary dictionaryWithObjects:@[nameText.text, willReplaceDict[kPhoneNum],willReplaceDict[kPortrait]] forKeys:@[kName,kPhoneNum,kPortrait]];
            [_childrenArry replaceObjectAtIndex:_num withObject:addDict];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        }
    }else{
        if (buttonIndex == 1) {
            UITextField *phoneNumText = [_modifyPhoneNumAlertView textFieldAtIndex:0];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_num inSection:0];
            NSDictionary *willReplaceDict = [_childrenArry objectAtIndex:_num];
            NSDictionary *addDict = [NSDictionary dictionaryWithObjects:@[willReplaceDict[kName], phoneNumText.text,willReplaceDict[kPortrait]] forKeys:@[kName,kPhoneNum,kPortrait]];
            [_childrenArry replaceObjectAtIndex:_num withObject:addDict];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        }
    
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    UITextField *oldText ;
    if (alertView == _modifyNameAlertView) {
        oldText = [_modifyNameAlertView textFieldAtIndex:0];
        oldText.text = _childrenArry[_num][kName];
    }else{
        oldText = [_modifyPhoneNumAlertView textFieldAtIndex:0];
        oldText.text = _childrenArry[_num][kPhoneNum];
    }
}
#if 0
- (void)willPresentAlertView:(UIAlertView *)alertView
{
    UITextField *oldText;
    if (alertView == _modifyNameAlertView) {
        oldText = [_modifyNameAlertView textFieldAtIndex:0];
        oldText.text = _childrenArry[_num][kName];
    }
    
    if (alertView == _modifyPhoneNumAlertView) {
        oldText = [_modifyPhoneNumAlertView textFieldAtIndex:0];
        oldText.text = _childrenArry[_num][kPhoneNum];
    }

}
#endif

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
