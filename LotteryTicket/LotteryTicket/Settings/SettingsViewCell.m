//
//  SettingsViewCell.m
//  LotteryTicket
//
//  Created by xcc on 14-7-30.
//  Copyright (c) 2014年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import "SettingsViewCell.h"
#import "SettingsItem.h"

@interface SettingsViewCell()
{
    UIImageView *_arrow;
    UISwitch *_switch;
    UILabel *_label;
}
@end

@implementation SettingsViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 清空label的背景色
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.highlightedTextColor = self.textLabel.textColor;
    }
    
    return self;
}

- (void)setItem:(SettingsItem *)item
{
    _item = item;
    
    // 设置数据
    self.imageView.image = [UIImage imageNamed:item.icon];
    self.textLabel.text = item.title;
    
    if (item.type == SettingsItemTypeArror) {
        
        if (_arrow == nil) {
            _arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
        }
        
        // 右边显示箭头
        self.accessoryView = _arrow;
        // 用默认的选中状态
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    } else if (item.type == SettingsItemTypeSwitch) {
        
        if ( _switch == nil) {
            _switch = [[UISwitch alloc] init];
        }
        
        // 右边显示开关
        self.accessoryView = _switch;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    } else if (item.type == SettingsItemTypeLabel) {
        
        if (_label == nil) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
            // uilable默认背景色是白色，所有要clean
            label.backgroundColor = [UIColor clearColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor grayColor];
            label.font = [UIFont systemFontOfSize:12];
            _label = label;
        }
        self.accessoryView = _label;
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    } else {
        
        // 什么也没有，清空右边显示的View
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    
}
@end
