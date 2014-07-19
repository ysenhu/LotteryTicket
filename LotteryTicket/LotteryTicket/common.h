//
//  common.h
//  LotteryTicket
//
//  Created by xcc on 14-7-19.
//  Copyright (c) 2014年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#ifndef LotteryTicket_common_h
#define LotteryTicket_common_h

// 判断是否为iPhone5的宏
#define iPhone5 ([UIScreen mainScreen].bounds.size.height == 568)

// 日志输出宏定义
#ifdef DEBUG
// 调试状态
#define MyLog(...) NSLog(__VA_ARGS__)
#else
// 发布状态
#define MyLog(...)
#endif

#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

// 获得RGB颜色
#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

//获取设备的物理高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//获取设备的物理宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#endif
