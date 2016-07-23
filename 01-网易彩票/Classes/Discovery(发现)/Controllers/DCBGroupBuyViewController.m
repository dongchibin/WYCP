//
//  DCBGroupBuyViewController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/19.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBGroupBuyViewController.h"

@interface DCBGroupBuyViewController ()

@property (nonatomic, strong) UIView *popView;

@end

@implementation DCBGroupBuyViewController

- (IBAction)allLotteryButtonClick:(UIButton *)sender
{
    if (_popView.bounds.size.height == 0) {
        
        [UIView animateWithDuration:0.5 animations:^{
           
            sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
            
//            self.popView.frame.size.height = @(70);
//            CGFloat h = 70;
//            CGre
//            self.popView.frame.size.height = 70;
            self.popView.height = 200;
            
//            self.popView.alpha = 1;
            
        }];
    }else
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            sender.imageView.transform = CGAffineTransformIdentity;
            
//            self.popView.alpha = 0;
            self.popView.height = 0;
        }];
    }
}

- (UIView *)popView
{
    if (!_popView) {
        
        _popView = [[UIView alloc] init];
        
        _popView.backgroundColor = [UIColor redColor];
        
        _popView.x = 0;
        _popView.y = 64;
        _popView.width = self.view.width;
        _popView.height = 0;
        
        [self.view addSubview:_popView];
    }
    return _popView;
}

@end
