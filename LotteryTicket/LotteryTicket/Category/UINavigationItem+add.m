//
//  UINavigationItem+add.m
//  Tqmall
//
//  Created by xcc on 14-7-11.
//  Copyright (c) 2014年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import "UINavigationItem+add.h"

@implementation UINavigationItem (add)

- (void)copyFromItem:(UINavigationItem *)other
{
    self.leftBarButtonItem = other.leftBarButtonItem;
    self.leftBarButtonItems = other.leftBarButtonItems;
    self.rightBarButtonItem = other.rightBarButtonItem;
    self.rightBarButtonItems = other.rightBarButtonItems;
    self.titleView = other.titleView;
    self.title = other.title;
}

@end
