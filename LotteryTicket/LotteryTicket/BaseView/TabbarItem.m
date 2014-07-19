//
//  TabbarItem.m
//  Tqmall
//
//  Created by xcc on 14-7-11.
//  Copyright (c) 2014年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import "TabbarItem.h"
#define kTitleRatio 0.3
@implementation TabbarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setTitleColor:kColor(252, 199, 12) forState:UIControlStateSelected];
        [self setTitleColor:kColor(128, 128, 128) forState:UIControlStateNormal];
    }
    return self;
}

#pragma mark 覆盖父类的hightlighted时的所有操作
- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height * (1 - kTitleRatio));
}

// 调整内部UILabel的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, contentRect.size.height * (1 - kTitleRatio) - 3, contentRect.size.width,contentRect.size.height * kTitleRatio);
}

@end
