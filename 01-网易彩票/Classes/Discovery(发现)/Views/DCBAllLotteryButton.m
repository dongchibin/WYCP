//
//  DCBAllLotteryButton.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/21.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBAllLotteryButton.h"

@implementation DCBAllLotteryButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    
    self.imageView.x = self.titleLabel.width + 5;
}

@end
