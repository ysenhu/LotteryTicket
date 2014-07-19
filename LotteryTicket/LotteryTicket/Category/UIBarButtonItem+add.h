//
//  UIBarButtonItem+add.h
//  Tqmall
//
//  Created by xcc on 14-7-11.
//  Copyright (c) 2014年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (add)
//- (id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action;
+ (id)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action;
@end
