//
//  SettingsItem.m
//  LotteryTicket
//
//  Created by xcc on 14-7-30.
//  Copyright (c) 2014年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//  设置cell的数据模型

#import "SettingsItem.h"

@implementation SettingsItem

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.title = dict[@"name"];
        self.type = [dict[@"type"] intValue];
    }
    
    return self;
}
@end
