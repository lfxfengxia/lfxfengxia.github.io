//
//  TransitionViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-15.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "TransitionViewController.h"

#define numberOfPictures    7

@interface TransitionViewController ()

@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)UIImageView *mainImgView;
@property(nonatomic,strong)UIImageView *foolImgView;

@end

@implementation TransitionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"show transition";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _contentView = [[UIView alloc]initWithFrame:self.view.bounds];
    _contentView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:_contentView];
    
    _mainImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"51.jpg"]];
    _mainImgView.frame = CGRectMake(50, 120, 230, 240);
    [_contentView addSubview:_mainImgView];
    
    _foolImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"9"]];
    _foolImgView.frame = CGRectMake(50, 120, 230, 240);
    [_contentView addSubview:_foolImgView];
    
    UIButton *flipBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [flipBtn setTitle:@"flipPicture" forState:UIControlStateNormal];
    flipBtn.frame = CGRectMake(60, 430, 80, 30);
    flipBtn.tag = 1000;
    [flipBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:flipBtn];
    
    UIButton *curlBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [curlBtn setTitle:@"curlPicture" forState:UIControlStateNormal];
    curlBtn.frame = CGRectMake(180, 430, 80, 30);
    curlBtn.tag = 1001;
    [curlBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:curlBtn];
    
    UIButton *moveBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [moveBtn setTitle:@"movePicture" forState:UIControlStateNormal];
    moveBtn.frame = CGRectMake(50, 470, 90, 30);
    moveBtn.tag = 1003;
    [moveBtn addTarget:self action:@selector(clickMoveBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moveBtn];
    
    UIButton *rotateBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [rotateBtn setTitle:@"rotatePicture" forState:UIControlStateNormal];
    rotateBtn.frame = CGRectMake(180, 470, 90, 30);
    rotateBtn.tag = 1004;
    [rotateBtn addTarget:self action:@selector(clickMoveBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rotateBtn];
}
#if 0
- (void)clickBtn:(UIButton *)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    if (sender.tag == 1000) {
        [UIView setAnimationTransition:[_mainImgView superview] ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight forView:_contentView cache:YES];
    }else{
        [UIView setAnimationTransition:[_mainImgView superview] ? UIViewAnimationTransitionCurlDown : UIViewAnimationTransitionCurlUp forView:_contentView cache:YES];
    }
    if ([_mainImgView superview]) {
        [_mainImgView removeFromSuperview];
        [_contentView addSubview:_foolImgView];
    }else{
        [_foolImgView removeFromSuperview];
        [_contentView addSubview:_mainImgView];
    }
    [UIView commitAnimations];
}
#endif

- (void)clickBtn:(UIButton *)sender
{
    [self btnClickWithBlock:^{
    
    }];
}

- (void)clickMoveBtn:(UIButton *)sender
{
    [self btnClickWithBlock:^{
        UIImageView *tmpImgView = [_contentView.subviews lastObject];
        CGPoint center = tmpImgView.center;
        if (sender.tag == 1003) {
            center.y -= 10;
            tmpImgView.center = center;
        }else{
            tmpImgView.transform = CGAffineTransformRotate(tmpImgView.transform, M_PI_4);
        }
    }];
}

- (void)btnClickWithBlock:(void (^)())block
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    block();
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
