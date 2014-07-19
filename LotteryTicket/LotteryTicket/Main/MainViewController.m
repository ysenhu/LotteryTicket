//
//  MainViewController.m
//  LotteryTicket
//
//  Created by xcc on 14-7-19.
//  Copyright (c) 2014年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import "MainViewController.h"
#import "HallViewController.h"
#import "UnionBuyViewController.h"
#import "LuckyNumberViewController.h"
#import "LotteryInfoViewController.h"
#import "MineViewController.h"
#import "TabbarItem.h"
#import "UINavigationItem+add.h"
#import "TabBarButton.h"
@interface MainViewController ()
{
    UIView *_tabbarView;
    UIButton *_selectedItem;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBar setHidden:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    if (iOS7) {
//        // 1.UIRectEdgeNone不要往四周边缘展开(按照非iOS7的传统来展示)
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        
//        // 2.让所有的子控制器都不能展开
//        for (UIViewController *vc in self.childViewControllers) {
//            vc.edgesForExtendedLayout = UIRectEdgeNone;
//        }
//        
//        // NO代表展开的时候不要包含那个条
//        //        self.extendedLayoutIncludesOpaqueBars = NO;
//    }
    
    // 自动会调用scrollView的contentInsets（比如group样式的tableView的insets.top=64）
    //    self.automaticallyAdjustsScrollViewInsets = YES;
    
    // 初始化子控制器
    HallViewController *hall = [[HallViewController alloc] init];
    UnionBuyViewController *unionBuy = [[UnionBuyViewController alloc] init];
    LuckyNumberViewController *luck = [[LuckyNumberViewController alloc] init];
    LotteryInfoViewController *lotteryInfo = [[LotteryInfoViewController alloc] init];
    MineViewController *mine = [[MineViewController alloc] init];
    self.viewControllers = @[hall, unionBuy, lotteryInfo, luck, mine];
    
    // 创建自定义的tabbar
//    [self setTabBarView];
}

- (void)viewWillAppear:(BOOL)animated
{
    _tabbarView = [[UIView alloc] initWithFrame:self.tabBar.frame];
    NSLog(@"tabbarView : %@", NSStringFromCGRect(self.tabBar.frame));
    [self.view addSubview:_tabbarView];
    
    for (int i = 0; i < 5; i++) {
        NSString *normal = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *selected = [normal stringByAppendingString:@"Sel"];
        
        TabBarButton *button = [[TabBarButton alloc] initWithFrame:CGRectMake(i * (self.view.frame.size.width / 5.0), 0, self.view.frame.size.width / 5.0, _tabbarView.frame.size.height)];
        [button setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
        button.tag = i;
        [button addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
        if (i == 0) {
            _selectedItem = button;
            button.selected = YES;
            [self itemClick:button];
        }
        [_tabbarView addSubview:button];
    }

}
//-(void)setTabBarView
//{
//    CGRect rect = self.tabBar.frame;
//    if (!iOS7) {
//        rect.origin.y -= (49 + 20);
//    }
//    _tabbarView = [[UIView alloc] initWithFrame:rect];
//    
//    [self.view addSubview:_tabbarView];
//    _tabbarView.backgroundColor = [UIColor whiteColor];
//    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _tabbarView.frame.size.width, 0.5)];
//    line.backgroundColor = kColor(128, 128, 128);
//    [_tabbarView addSubview:line];
//    
//    NSArray *titles = @[@"首页", @"查找", @"车型", @"资讯", @"我的淘汽"];
//    for (int i = 0; i < 5; i++) {
//        NSString *normal = [NSString stringWithFormat:@"tab_icon_%d", i];
//        NSString *selected = [normal stringByAppendingString:@"Sel"];
//        
//        TabbarItem * item = [[TabbarItem alloc] initWithFrame:CGRectMake(i * (self.view.frame.size.width / 5.0), 0, self.view.frame.size.width / 5.0, _tabbarView.frame.size.height)];
//        NSLog(@"%@", NSStringFromCGRect(item.frame));
//        [item setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
//        [item setTitle:[titles objectAtIndex:i] forState:UIControlStateSelected];
//        [item setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
//        [item setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
//        [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
//        item.tag = i;
//        [_tabbarView addSubview:item];
//        if (i == 0) {
//            _selectedItem = item;
//            item.selected = YES;
//            [self itemClick:item];
//        }
//    }
//}

- (void)itemClick:(UIButton *)item
{
    UIViewController *control = self.childViewControllers[item.tag];
    [self.navigationItem copyFromItem:control.navigationItem];
    if (_selectedItem.tag != item.tag) {
        self.selectedIndex = item.tag;
        item.selected = YES;
        _selectedItem.selected = NO;
        _selectedItem = item;
    }
}


@end
