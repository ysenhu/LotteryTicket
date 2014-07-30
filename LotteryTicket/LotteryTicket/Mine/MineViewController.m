//
//  MineViewController.m
//  LotteryTicket
//
//  Created by xcc on 14-7-19.
//  Copyright (c) 2014年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import "MineViewController.h"
#import "SettingsViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"我的彩票";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(clickedSettingButtonItem)];
}
                                  
#pragma mark - private
- (void)clickedSettingButtonItem
{
    SettingsViewController *settingsViewController = [[SettingsViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:settingsViewController animated:YES];
}


@end
