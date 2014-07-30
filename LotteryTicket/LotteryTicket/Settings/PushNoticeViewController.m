//
//  PushNoticeViewController.m
//  LotteryTicket
//
//  Created by xcc on 14-7-30.
//  Copyright (c) 2014年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//  提醒和推送

#import "PushNoticeViewController.h"
#import "SettingsViewCell.h"
#import "SettingsItem.h"

@interface PushNoticeViewController ()
{
    NSArray *_data;
}
@end

@implementation PushNoticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"设置";
    
    // 1.设置背景
    // backgroundView的优先级 > backgroundColor
    self.tableView.backgroundView = nil;
    //    // 0~1
    self.tableView.backgroundColor = kGlobalBg;
    
    // 2.设置tableView每组头部的高度
    self.tableView.sectionHeaderHeight = 5;
    self.tableView.sectionFooterHeight = 0;
    
    // 获取路径
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"PushNotice" withExtension:@"plist"];
    _data = [NSArray arrayWithContentsOfURL:url];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_data[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 0.用static修饰的局部变量，只会初始化一次
    static NSString *cellIdentifier = @"cell";
    
    // 1.拿到一个标识先去缓存池中查找对应的Cell
    SettingsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // 2.如果缓存池中没有，才需要传入一个标识创建新的Cell
    if (cell == nil) {
        cell = [[SettingsViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // 取出这行对应的字典数
    NSDictionary *dict = _data[indexPath.section][indexPath.row];
    cell.item = [[SettingsItem alloc] initWithDict:dict];
    
    return cell;
}

@end
