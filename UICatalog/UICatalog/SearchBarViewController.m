//
//  SearchBarViewController.m
//  UICatalog
//
//  Created by qingyun on 14-11-14.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "SearchBarViewController.h"

@interface SearchBarViewController ()

@property(nonatomic,strong)UISearchBar *searchBar;

@end

@implementation SearchBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"UISearchBar";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cellColor"]];
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 70, self.view.bounds.size.width, 42)];
    _searchBar.placeholder = @"Please input linker";
    _searchBar.showsBookmarkButton = YES;
    _searchBar.showsCancelButton = YES;
    //_searchBar.showsSearchResultsButton = YES;
    _searchBar.delegate = self;
    [self.view addSubview:_searchBar];
    
    NSArray *items = @[@"default",@"minmal",@"barTintcolor",@"background"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:items];
    segmentedControl.frame = CGRectMake(10, 300, 300, 40);
    [segmentedControl addTarget:self action:@selector(changeSearchBarStyleWithSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:searchBar.text]]];
    [self.view addSubview:webView];
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
                               
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    searchBar.showsScopeBar = YES;
    if (self.navigationController.navigationBarHidden) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        searchBar.frame = CGRectMake(0, 70, 320, 40);
    }else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        searchBar.frame = CGRectMake(0, 20, 320, 40);
    }
}
#pragma mark - segmetedControl 控制searchBar的风格
- (void)changeSearchBarStyleWithSegmentedControl:(UISegmentedControl *)sender
{
    _searchBar.barTintColor = nil;
    _searchBar.backgroundImage = nil;
    _searchBar.scopeBarBackgroundImage = nil;
    switch (sender.selectedSegmentIndex) {
        case 0:
            _searchBar.searchBarStyle = UISearchBarStyleProminent;
            _searchBar.tintColor = [UIColor greenColor];
        case 1:
            _searchBar.searchBarStyle = UISearchBarStyleMinimal;
            break;
        case 2:
            _searchBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"QYVc.jpg"]];
            [_searchBar setImage:[UIImage imageNamed:@"bookmarkImage"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
            [_searchBar setImage:[UIImage imageNamed:@"bookmarkImageHighlighted"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
            break;
        case 3:
            _searchBar.backgroundImage = [UIImage imageNamed:@"11"];
            _searchBar.scopeBarBackgroundImage = [UIImage imageNamed:@"cellColor"];
            break;
        default:
            break;
    }
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
