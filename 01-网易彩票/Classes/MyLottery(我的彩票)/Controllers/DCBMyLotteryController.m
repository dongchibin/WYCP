//
//  DCBMyLotteryController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/21.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBMyLotteryController.h"
#import "DCBSettingController.h"
#import "DCBHelpController.h"

@interface DCBMyLotteryController ()

@property (nonatomic, weak) IBOutlet UIButton *loginButton;

@property (nonatomic, weak) IBOutlet UIButton *resginButton;

@end

@implementation DCBMyLotteryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *img = [UIImage imageNamed:@"RedButton"];

    
    //登录按钮背景图片拉伸
    [img stretchableImageWithLeftCapWidth:img.size.width * 0.5 topCapHeight:img.size.height * 0.5];
    
    [self.loginButton setBackgroundImage:img forState:UIControlStateNormal];
    [self.resginButton setBackgroundImage:img forState:UIControlStateNormal];
    
    UIImage *img1 = [UIImage imageNamed:@"RedButtonPressed"];
    
    [img1 stretchableImageWithLeftCapWidth:img.size.width * 0.5 topCapHeight:img.size.height * 0.5];
    
    [self.loginButton setBackgroundImage:img1 forState:UIControlStateSelected];
    [self.resginButton setBackgroundImage:img1 forState:UIControlStateSelected];
}

- (IBAction)settingItemClick:(UIBarButtonItem *)sender
{
    DCBSettingController *settingVc = [[DCBSettingController alloc] init];
    
    settingVc.navigationItem.title = @"常见设置";
    
    settingVc.plistName = @"DCBSettingHome.plist";
    
    UIBarButtonItem *helpfulItem = [[UIBarButtonItem alloc] initWithTitle:@"帮助" style:UIBarButtonItemStylePlain target:self action:@selector(helpfulItemClick)];
    
    settingVc.navigationItem.rightBarButtonItem = helpfulItem;
    
    [self.navigationController pushViewController:settingVc animated:YES];

}

- (void)helpfulItemClick
{
    DCBHelpController *helpVc = [[DCBHelpController alloc] init];
    
    [self.navigationController pushViewController:helpVc animated:YES];
}


@end
