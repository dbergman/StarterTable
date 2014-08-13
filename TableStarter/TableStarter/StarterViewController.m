//
//  StarterViewController.m
//  TableStarter
//
//  Created by Dustin Bergman on 8/11/14.
//  Copyright (c) 2014 Dustin Bergman. All rights reserved.
//

#import "StarterViewController.h"

@interface StarterViewController () <UITableViewDataSource, UITableViewDelegate, UIBarPositioningDelegate, UISearchBarDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchDisplayController *searchDisplayController;
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation StarterViewController
@synthesize searchDisplayController;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Root ViewController";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(startSearch)];
    
    self.searchBar = [[UISearchBar alloc]init];
    self.searchBar.delegate = self;
    self.tableView.tableHeaderView = self.searchBar;
    self.tableView.tableHeaderView.frame = CGRectZero;
    self.searchBar.hidden = YES;

    self.searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    self.searchDisplayController.searchResultsDataSource = self;
    self.searchDisplayController.searchResultsDelegate = self;
    
}

- (void)startSearch {
    [self.searchDisplayController setActive:YES animated:YES];
    self.tableView.tableHeaderView = self.searchBar;
    self.searchBar.hidden = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar {
       self.searchBar.hidden = YES;
        self.tableView.tableHeaderView = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (int)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
    }
    cell.separatorInset = UIEdgeInsetsZero;
    cell.textLabel.text = [NSString stringWithFormat:@"Section:%d - Row:%d",indexPath.section, indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
