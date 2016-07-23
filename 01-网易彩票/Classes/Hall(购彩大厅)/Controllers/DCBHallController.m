//
//  DCBHallController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/19.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBHallController.h"
#import <CoreLocation/CoreLocation.h>

@interface DCBHallController ()

@property (nonatomic, weak) UIView *cover;

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, strong) CLLocationManager *mgr;

@end

@implementation DCBHallController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *activityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [activityBtn setImage:[UIImage imageNamed:@"CS50_activity_image"] forState:UIControlStateNormal];
    
    [activityBtn sizeToFit];
    
    [activityBtn addTarget: self  action:@selector(activityBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *activityItem = [[UIBarButtonItem alloc] initWithCustomView:activityBtn];
    
    self.navigationItem.leftBarButtonItem = activityItem;
    
    
}
- (IBAction)location:(id)sender
{
    self.mgr = [CLLocationManager new];
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
        [self.mgr requestWhenInUseAuthorization];
    }
    
    [self.mgr startUpdatingLocation];
    
    self.mgr.distanceFilter = 10;
    
    self.mgr.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
}

- (void)activityBtnClick
{
    UIView *cover = [[UIView alloc] initWithFrame:self.view.frame];
    
    cover.backgroundColor = [UIColor blackColor];
    
    cover.alpha = 0.3;
    
    [self.tabBarController.view addSubview:cover];
    
    self.cover = cover;
    
//    UIView *activityView = [[UIView alloc] initWithFrame:self.view.frame];
//    
//    activityView.backgroundColor = [UIColor redColor];
//    
//    [self.tabBarController.view addSubview:activityView];
    
    UIImageView *activityImageView = [[UIImageView alloc] init];
    
    activityImageView.center = self.view.center;
    activityImageView.bounds = CGRectMake(0, 0, 200, 300);
    
    activityImageView.image = [UIImage imageNamed:@"showActivity"];
    
    activityImageView.userInteractionEnabled = YES;
    
    [self.tabBarController.view addSubview:activityImageView];
    
    self.imageView = activityImageView;
    
    UIButton *activityButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [activityButton setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    
    [activityButton sizeToFit];
    
    CGFloat x = activityImageView.bounds.size.width - activityButton.bounds.size.width;
    
    CGFloat y = 0;
    
    activityButton.frame = CGRectMake(x, y, 19.5, 19.5);
    
    [activityImageView addSubview:activityButton];
    
    [activityButton addTarget: self action:@selector(activityButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)activityButtonClick
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.cover.alpha = 0;
        self.imageView.alpha = 0;
        
    } completion:^(BOOL finished) {
       
        [self.cover removeFromSuperview];
        [self.imageView removeFromSuperview];
        
    }];
}

@end
