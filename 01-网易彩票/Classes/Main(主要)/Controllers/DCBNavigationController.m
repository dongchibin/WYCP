//
//  DCBNavigationController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/19.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBNavigationController.h"

@interface DCBNavigationController ()

@end

@implementation DCBNavigationController

+ (void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    [navBar setTitleTextAttributes:@{
                                    NSForegroundColorAttributeName : [UIColor whiteColor],
                                    }];
    
    [navBar setTintColor:[UIColor whiteColor]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count > 0){
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        self.topViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
        
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}



@end
