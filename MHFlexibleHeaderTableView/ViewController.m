//
//  ViewController.m
//  MHFlexibleHeaderTableView
//
//  Created by mx on 15/9/5.
//  Copyright (c) 2015年 mx. All rights reserved.
//

#import "ViewController.h"
#import "FlexibleHeaderTableView/MHFlexibleSectionHeaderTableView.h"
#import "HeaderCell.h"

static NSString* HeaderCellIdentifier = @"HeaderCell";
static NSString* CommonCellIdentifier = @"CommonCell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, MHFlexibleSectionHeaderTableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    MHFlexibleSectionHeaderTableView* tableView = [MHFlexibleSectionHeaderTableView flexibleSectionHeaderTableViewWithHeaderClass:[HeaderCell class]];
    [tableView registerClass:[HeaderCell class] forCellReuseIdentifier:HeaderCellIdentifier];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CommonCellIdentifier];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.headerDelegate = self;
    tableView.separatorInset = UIEdgeInsetsZero;
    tableView.tableFooterView = [UIView new];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:tableView];
    
    id topLayoutGuide = self.topLayoutGuide;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tableView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topLayoutGuide][tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tableView, topLayoutGuide)]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        HeaderCell* cell = [tableView dequeueReusableCellWithIdentifier:HeaderCellIdentifier forIndexPath:indexPath];
        cell.label.text = @"Section Title";
        return cell;
    }else{
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CommonCellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = @"Detail";
        return cell;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

#pragma mark - MHFlexibleSetionHeaderTableViewDelegate
-(void)flexibleSectionHeaderTableView:(MHFlexibleSectionHeaderTableView *)tableView configHeader:(UIView *)header forSection:(NSUInteger)section{
    
    HeaderCell* cell = (HeaderCell*)header;
    cell.label.text = @"Section Title";
}

@end
