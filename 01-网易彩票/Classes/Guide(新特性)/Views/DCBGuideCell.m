//
//  DCBGuideCell.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/27.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBGuideCell.h"
#import "DCBTabBarController.h"

@implementation DCBGuideCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.hidden = YES;
        
        [button setImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        [button sizeToFit];
        
        button.x = (self.width  - button.width ) * 0.5;
        button.y = self.height * 0.85;
        
        [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        
        self.startBtn = button;
        
        [self.contentView addSubview:button];
        
    }
    return self;
}

- (void)buttonClick
{
    DCBTabBarController *tabBarVc = [[DCBTabBarController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVc;
}


@end
