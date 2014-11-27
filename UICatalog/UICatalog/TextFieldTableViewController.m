//
//  TextFieldTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "TextFieldTableViewController.h"

@interface TextFieldTableViewController ()

@property(nonatomic,strong)NSArray *textFieldArray;

@end

static NSString *sectionTitle = @"sectionTitle";
static NSString *labelText = @"labelText";
static NSString *textFieldType = @"textFieldType";

static NSInteger viewTag = 1010;

@implementation TextFieldTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UITextField";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
#pragma mark 设置tableHeaderView
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    headerLabel.text = @"uses of textField";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4"]];
    headerLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:30];
    headerLabel.textColor = [UIColor cyanColor];
    self.tableView.tableHeaderView = headerLabel;
    /**
     UITextBorderStyleNone,
     UITextBorderStyleLine,
     UITextBorderStyleBezel,
     UITextBorderStyleRoundedRect
     */
#pragma mark textField type
    UITextField *noneTextField = [[UITextField alloc]init];
    [self bulidTextField:noneTextField];
    
    UITextField *lineTextField = [[UITextField alloc]init];
    lineTextField.borderStyle = UITextBorderStyleLine;
    [self bulidTextField:lineTextField];
    
    UITextField *bezelTextField = [[UITextField alloc]init];
    bezelTextField.borderStyle = UITextBorderStyleBezel;
    [self bulidTextField:bezelTextField];
    
    UITextField *roundRectTextField = [[UITextField alloc]init];
    roundRectTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self bulidTextField:roundRectTextField];
    
    UITextField *backgroundTextField = [[UITextField alloc]init];
    backgroundTextField.background = [UIImage imageNamed:@"0"];
    [self bulidTextField:backgroundTextField];
    
    UITextField *disablebackgroundTextField = [[UITextField alloc]init];
    disablebackgroundTextField.background = [UIImage imageNamed:@"6"];
    disablebackgroundTextField.enabled = NO;
    [self bulidTextField:disablebackgroundTextField];
    
    UITextField *leftRightViewTextField = [[UITextField alloc]init];
    UIImageView *leftImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
    leftImgView.frame = CGRectMake(0, 0, 40, 50);
    leftRightViewTextField.leftView = leftImgView;
    leftRightViewTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *rightImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3"]];
    rightImgView.frame = CGRectMake(0, 0, 40, 50);
    leftRightViewTextField.rightView = rightImgView;
    leftRightViewTextField.rightViewMode = UITextFieldViewModeUnlessEditing;
    [self bulidTextField:leftRightViewTextField];
    
    UITextField *inputViewTextField = [[UITextField alloc]init];
    UIImageView *inputView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"5"]];
    inputView.frame = CGRectMake(0, 0, 300, 50);
    inputViewTextField.inputView = inputView;
    UIImageView *inputAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"7"]];
    inputAccessoryView.frame = CGRectMake(0, 0, 300, 50);
    inputViewTextField.inputAccessoryView = inputAccessoryView;
    [self bulidTextField:inputViewTextField];
    
    _textFieldArray = @[
                        @{sectionTitle: @"textField type",
                          labelText:@"none textField",
                          textFieldType:noneTextField},
                        @{sectionTitle: @"textField type",
                          labelText:@"line textField",
                          textFieldType:lineTextField},
                        @{sectionTitle: @"textField type",
                          labelText:@"bezel textField",
                          textFieldType:bezelTextField},
                        @{sectionTitle: @"textField type",
                          labelText:@"roundRect textField",
                          textFieldType:roundRectTextField},
                        @{sectionTitle: @"textField type",
                          labelText:@"background textField",
                          textFieldType:backgroundTextField},
                        @{sectionTitle: @"textField type",
                          labelText:@"disablebackground textField",
                          textFieldType:disablebackgroundTextField},
                        @{sectionTitle: @"textField type",
                          labelText:@"leftRightView textField",
                          textFieldType:leftRightViewTextField},
                        @{sectionTitle: @"textField type",
                          labelText:@"inputView & inputAccessory textField",
                          textFieldType:inputViewTextField},
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
    
    return _textFieldArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}

#pragma mark cell的创建及重用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
/*   if (indexPath.row == 0) {
        static NSString *identifier = @"UITableview";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        }
        cell.textLabel.text = _textFieldArray[indexPath.section][labelText];
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        UITextField *tmptextfield = _textFieldArray[indexPath.section][textFieldType];
        [cell.contentView addSubview:tmptextfield];
        return cell;
    }
*/
    static NSString *identifier = @"UITableview";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    UIView *removeview = [cell.contentView viewWithTag:viewTag];
    if (removeview != nil) {
        [removeview removeFromSuperview];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = _textFieldArray[indexPath.section][labelText];
    }else{
        UITextField *tmptextfield = _textFieldArray[indexPath.section][textFieldType];
        [cell.contentView addSubview:tmptextfield];
    }
    return cell;
}
#pragma mark 设置headerTitle
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _textFieldArray[section][sectionTitle];
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
#pragma mark 创建textField
- (void)bulidTextField:(UITextField *)textField
{
    textField.frame = CGRectMake(10, 5, 300, 50);
    textField.tag = viewTag;
    textField.tintColor = [UIColor brownColor];
    textField.font = [UIFont fontWithName:@"Futura" size:20];
    textField.placeholder = @"please input something";
    textField.clearsOnBeginEditing = YES;
    textField.adjustsFontSizeToFitWidth = YES;
}
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
