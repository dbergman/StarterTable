//
//  StarterViewController.m
//  TableStarter
//
//  Created by Dustin Bergman on 8/11/14.
//  Copyright (c) 2014 Dustin Bergman. All rights reserved.
//

#import "StarterViewController.h"
#import "PopUpViewController.h"

@interface StarterViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) PopUpViewController *popVC;
@end

@implementation StarterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Root ViewController";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(popUpViewAction)];
    
    [self setupPopUP];
}

- (void)setupPopUP {
    self.popVC = [[PopUpViewController alloc] init];
    self.popVC.view.backgroundColor = [UIColor purpleColor];
    
    self.popVC.view.frame = CGRectMake(0.0, self.view.frame.size.height, self.view.frame.size.width, 250);
    
    [self.view addSubview:self.popVC.view];
}

- (void)popUpViewAction {

    [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:.5 initialSpringVelocity:.9 options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.popVC.view.frame = CGRectMake(0.0, 80.0, self.view.frame.size.width, 250);
    } completion:^(BOOL finished) {
        sleep(2.0);
        [UIView animateWithDuration:.3 animations:^{
            self.popVC.view.frame = CGRectMake(0.0, self.view.frame.size.height, self.view.frame.size.width, 250);
        }];
        
    }];
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
