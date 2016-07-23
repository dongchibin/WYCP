//
//  DCBTabBarController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/19.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBTabBarController.h"
#import "DCBTabBar.h"

@interface DCBTabBarController ()<DCBTabBarDelegate>

@end

@implementation DCBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupChildVc];
    
    [self setupTabBar];
}

- (void)setupTabBar
{
    DCBTabBar *tabBar = [[DCBTabBar alloc] init];
    
    tabBar.delegate = self;
    
    tabBar.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:tabBar];
}

- (void)tabBar:(DCBTabBar *)tabBar andTo:(NSUInteger)to
{
    self.selectedIndex  = to;
}

- (void)setupChildVc
{
    UINavigationController *navHall = [self navWithSBName:@"DCBHall"];
    
    UINavigationController *navAnera = [self navWithSBName:@"DCBAnera"];
    
    UINavigationController *navDiscovery = [self navWithSBName:@"DCBDiscovery"];
    
    UINavigationController *navMessage = [self navWithSBName:@"DCBMessage"];
    
    UINavigationController *navMyLottery = [self navWithSBName:@"DCBMyLottery"];
    
    self.viewControllers = @[navHall, navAnera, navDiscovery, navMessage, navMyLottery];
}

- (UINavigationController *)navWithSBName:(NSString *)sbName
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    
    UINavigationController *nav = [sb instantiateInitialViewController];
    
    nav.topViewController.view.backgroundColor = DCBRandomColor;
    
    return nav;
}

@end
