//
//  DCBMessageController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/19.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBMessageController.h"

@interface DCBMessageController ()

@end

@implementation DCBMessageController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [messageButton setImage:[UIImage imageNamed:@"Historyawards_pushSettings"] forState:UIControlStateNormal];
    [messageButton setTitle:@"开奖信息" forState:UIControlStateNormal];
    
    [messageButton sizeToFit];
    
    [messageButton addTarget: self action:@selector(messageButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc] initWithCustomView:messageButton];
    
    self.navigationItem.rightBarButtonItem = messageItem;
    
}

- (void)messageButtonClick
{
    
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"点点点" message:@"臭傻逼" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"就是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIAlertController *alertVc1 = [UIAlertController alertControllerWithTitle:@"点点点" message:@"臭傻逼" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"就是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            UIAlertController *alertVc2 = [UIAlertController alertControllerWithTitle:@"点点点" message:@"臭傻逼" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"就是" style:UIAlertActionStyleDefault handler:nil];
            
            [alertVc2 addAction:action2];
            
            [self presentViewController:alertVc2 animated:YES completion:nil];
        }];
        
        [alertVc1 addAction:action1];
        
        [self presentViewController:alertVc1 animated:YES completion:nil];
    }];
    
    [alertVc addAction:action];
    
    [self presentViewController:alertVc animated:YES completion:nil];
}




@end
