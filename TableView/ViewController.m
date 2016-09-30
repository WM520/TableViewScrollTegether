//
//  ViewController.m
//  TableView
//
//  Created by forever on 2016/9/30.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView *leftView;
@property (nonatomic, weak) UITableView *rightView;
@property (nonatomic, strong) NSMutableArray *rightSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self configUI];
}

- (void)configUI
{
    (void)self.leftView;
    (void)self.rightView;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _leftView) {
        return 5;
    }
    return self.rightSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (tableView == _leftView) {
        cell.textLabel.text = [NSString stringWithFormat:@"left :%ld", indexPath.row];
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@" right :%@", self.rightSource[indexPath.row]];
    }
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftView) {
        
        [self.rightSource addObject:@"1"];
        [self.rightSource addObject:@"2"];
        [self.rightSource addObject:@"3"];
        [self.rightSource addObject:@"4"];
        [self.rightView reloadData];
    }
}

#pragma mark setter and getter
- (UITableView *)leftView
{
    if (!_leftView) {
        UITableView *leftView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT) style:UITableViewStylePlain];
        leftView.delegate = self;
        leftView.dataSource = self;
        [self.view addSubview:leftView];
        _leftView = leftView;
    }
    return _leftView;
}

- (UITableView *)rightView
{
    if (!_rightView) {
        UITableView *rightView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2, 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT) style:UITableViewStylePlain];
        rightView.delegate = self;
        rightView.dataSource = self;
        [self.view addSubview:rightView];
        _rightView = rightView;
    }
    return _rightView;
}

- (NSMutableArray *)rightSource
{
    if (!_rightSource) {
        _rightSource = [[NSMutableArray alloc] init];
    }
    return _rightSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
