//
//  SettingsViewController.m
//  LotteryTicket
//
//  Created by xcc on 14-7-29.
//  Copyright (c) 2014年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsViewCell.h"
#import "SettingsItem.h"
#import "PushNoticeViewController.h"

@interface SettingsViewController ()
{
    NSArray *_data;
}

@end

@implementation SettingsViewController

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
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"More" withExtension:@"plist"];
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

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    
//}

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

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:     //推送和提醒
            {
                PushNoticeViewController *push = [[PushNoticeViewController alloc] initWithStyle:UITableViewStyleGrouped];
                [self.navigationController pushViewController:push animated:YES];
            }
                break;
            case 1:     //摇一摇机选
                
                break;
            case 2:     //声音效果
                
                break;
            case 3:     //推送和提醒
                
                break;
                
            default:
                break;
        }
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:     //检查新版本
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"暂时没有新版本" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [alert show];
            }
                break;
            case 1:     //帮助
                
                break;
            case 2:     //分享
                
                break;
            case 3:     //检查更多
                
                break;
                break;
            case 4:     //产品推荐
                
                break;
            case 5:     //关于
                
                break;
                
            default:
                break;
        }
    }
    
}

@end
