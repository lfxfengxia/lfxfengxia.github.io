//
//  ButtonTableViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-11.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "ButtonTableViewController.h"

#define kSectionTitle       @"kSectionTitle"
#define kBtnTypeName        @"btnTypeName"
#define kBtnType            @"btntype"
#define kTextLabel          @"kTextLabel"

@interface ButtonTableViewController ()

@property(nonatomic,strong)NSArray *btnArray;

@end

@implementation ButtonTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UIButton";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
#pragma mark 设置tableHeaderView
    UILabel *headerLabel = [[UILabel alloc]init];
    [self buildLabel:headerLabel atX:0 y:0 width:320 hight:60 andSetText:@"Uses of button"];
    headerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4"]];
    headerLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:30];
    headerLabel.textColor = [UIColor cyanColor];
    self.tableView.tableHeaderView = headerLabel;
    
#pragma mark 设置button type
    UIButton *colorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self buildButton:colorBtn atX:220 y:10 width:60 hight:40 andSetTitle:@"gray"];
    colorBtn.backgroundColor = [UIColor grayColor];
    UILabel *colorLabel = [[UILabel alloc]init];
    [self buildLabel:colorLabel atX:80 y:2 width:160 hight:40 andSetText:@"background with color --- grayColor"];
    
    UIButton *imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self buildButton:imgBtn atX:220 y:10 width:60 hight:40 andSetTitle:@"image"];
    [imgBtn setImage:[UIImage imageNamed:@"0"] forState:UIControlStateNormal];
    [imgBtn setImage:[UIImage imageNamed:@"6"] forState:UIControlStateHighlighted];
    UILabel *imgLabel = [[UILabel alloc]init];
    [self buildLabel:imgLabel atX:80 y:2 width:160 hight:40 andSetText:@"background with image --- Rose"];
    
    UIButton *roundBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self buildButton:roundBtn atX:220 y:10 width:60 hight:40 andSetTitle:@"Round"];
    UILabel *roundLabel = [[UILabel alloc]init];
    [self buildLabel:roundLabel atX:60 y:2 width:160 hight:40 andSetText:@"round button typr -->"];
    UIImageView *btnImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btn_background_pressed"]];
    btnImgView.frame = CGRectMake(150, 0, 60, 40);
    [roundLabel addSubview:btnImgView];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self buildButton:addBtn atX:230 y:10 width:40 hight:40 andSetTitle:nil];
    UILabel *addLabel = [[UILabel alloc]init];
    [self buildLabel:addLabel atX:80 y:2 width:160 hight:40 andSetText:@"button with plus sign （+）"];
    
    UIButton *infoDarkBtn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [self buildButton:infoDarkBtn atX:230 y:10 width:40 hight:40 andSetTitle:nil];
    UILabel *infoDarkLabel = [[UILabel alloc]init];
    [self buildLabel:infoDarkLabel atX:80 y:2 width:160 hight:40 andSetText:@"button with infoDark sign （i）"];
    
    UIButton *infoLightBtn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [self buildButton:infoLightBtn atX:230 y:10 width:40 hight:40 andSetTitle:nil];
    UILabel *infoLightLabel = [[UILabel alloc]init];
    [self buildLabel:infoLightLabel atX:80 y:2 width:160 hight:40 andSetText:@"button with infoLight sign （i）"];
    
    UIButton *disclosureBtn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [self buildButton:disclosureBtn atX:230 y:10 width:40 hight:40 andSetTitle:nil];
    UILabel *disclosureLabel = [[UILabel alloc]init];
    [self buildLabel:disclosureLabel atX:80 y:2 width:160 hight:40 andSetText:@"button with info sign （i）"];
    
#pragma mark 设置tintColor
    UIButton *tintColorBtn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [self buildButton:tintColorBtn atX:230 y:10 width:40 hight:40 andSetTitle:nil];
    UILabel *tintColorLabel = [[UILabel alloc]init];
    tintColorBtn.tintColor = [UIColor magentaColor];
    [self buildLabel:tintColorLabel atX:80 y:2 width:160 hight:40 andSetText:@"button with magenta color tintColor"];

#pragma mark 设置shadowColor and shadowOffset
    UIButton *shadowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self buildButton:shadowBtn atX:210 y:10 width:80 hight:40 andSetTitle:@"shadow"];
    [shadowBtn setTitleShadowColor:[UIColor cyanColor] forState:UIControlStateNormal];
    //shadowBtn.titleShadowOffset = CGSizeMake(2, 2);
    UILabel *shadowLabel = [[UILabel alloc]init];
    [self buildLabel:shadowLabel atX:80 y:2 width:160 hight:40 andSetText:@"background with color --- grayColor"];
    
    _btnArray = @[
                  @{kSectionTitle:@"UIButtonType",
                    kBtnTypeName:@"custom button",
                    kBtnType: colorBtn,
                    kTextLabel:colorLabel
                      },
                  @{kSectionTitle:@"UIButtonType",
                    kBtnTypeName:@"image button",
                    kBtnType: imgBtn,
                    kTextLabel:imgLabel
                    },
                  @{kSectionTitle:@"UIButtonType",
                    kBtnTypeName:@"round button",
                    kBtnType: roundBtn,
                    kTextLabel:roundLabel
                    },
                  @{kSectionTitle:@"UIButtonType",
                    kBtnTypeName:@"add button",
                    kBtnType: addBtn,
                    kTextLabel:addLabel
                    },
                  @{kSectionTitle:@"UIButtonType",
                    kBtnTypeName:@"infoDark button",
                    kBtnType: infoDarkBtn,
                    kTextLabel:infoDarkLabel
                    },
                  @{kSectionTitle:@"UIButtonType",
                    kBtnTypeName:@"infoLight button",
                    kBtnType: infoLightBtn,
                    kTextLabel:infoLightLabel
                    },
                  @{kSectionTitle:@"UIButtonType",
                    kBtnTypeName:@"detailDisclosure button",
                    kBtnType: disclosureBtn,
                    kTextLabel:disclosureLabel
                    },
                  @{kSectionTitle:@"Button tintColor",
                    kBtnTypeName:@"magentaColor tintColor",
                    kBtnType: tintColorBtn,
                    kTextLabel:tintColorLabel
                    },
                  @{kSectionTitle:@"Button shadow",
                    kBtnTypeName:@"cyanColor shadowColor",
                    kBtnType: shadowBtn,
                    kTextLabel:shadowLabel
                    }
                  ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
#pragma mark 确定sections的值
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _btnArray.count;
}
#pragma mark 确定rows的值
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
#pragma mark 创建cell及重用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"custom";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        UIButton *tmpBtn = [[UIButton alloc]init];
        cell.textLabel.text = _btnArray[indexPath.section][kBtnTypeName];
        tmpBtn = _btnArray[indexPath.section][kBtnType];
        [cell.contentView addSubview:tmpBtn];
    }else{
        UILabel *tmpLabel = [[UILabel alloc]init];
        tmpLabel = _btnArray[indexPath.section][kTextLabel];
        [cell.contentView addSubview:tmpLabel];
    }

    return cell;
}
#pragma mark 设置section title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _btnArray[section][kSectionTitle];
}
#pragma mark  设置footerView in each section
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    footerView.backgroundColor = [UIColor grayColor];
    return footerView;
}

#pragma mark - UITableViewDelegate
#pragma mark 设置headerView的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
#pragma mark 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 60;
    }else{
        return 40;
    }
}

#pragma mark - 初始化Button
/*#pragma mark 初始化colorBtn
//- (UIButton *)colorBtn
//{
//    if (_colorBtn == nil) {
//        _colorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self buildButton:_colorBtn atX:200 y:2 width:30 hight:40 andSetTitle:@"grayColor"];
//    }
//    return _colorBtn;
//}
//
//#pragma mark - 初始化Label
//#pragma mark 初始化colorLabel
//- (UILabel *)label
//{
//    if (_colorLabel == nil) {
//        _colorLabel = [[UILabel alloc]init];
//        [self buildLabel:_colorLabel atX:0 y:2 width:320 hight:40 andSetText:@"background with color --- grayColor"];
//    }
//    return _colorLabel;
//}
*/
#pragma mark - 自定义方法
#pragma mark 创建button
- (void)buildButton:(UIButton *)btn atX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width hight:(CGFloat)hight andSetTitle:(NSString *)title
{
    btn.frame = CGRectMake(x, y, width, hight);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
}

#pragma mark 创建label
- (void)buildLabel:(UILabel *)label atX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width hight:(CGFloat)hight andSetText:(NSString *)text
{
    label.frame = CGRectMake(x, y, width, hight);
    label.text = text;
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor lightGrayColor];
    label.numberOfLines = 2;
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
