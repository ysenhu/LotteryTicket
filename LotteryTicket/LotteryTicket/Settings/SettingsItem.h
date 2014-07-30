//
//  SettingsItem.h
//  LotteryTicket
//
//  Created by xcc on 14-7-30.
//  Copyright (c) 2014年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//  一个item对应一个cell
//  用来描述当前的cell里面的内容，描述点击cell后做什么

#import <Foundation/Foundation.h>

typedef enum {
    SettingItemTypeNone,        // 什么也没有
    SettingsItemTypeArror,      // 箭头
    SettingsItemTypeSwitch,     // 开关
    SettingsItemTypeLabel       // 文字
}SettingsItemType;

@interface SettingsItem : NSObject

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) SettingsItemType type; // cell的样式

- (id)initWithDict:(NSDictionary *)dict;
@end
