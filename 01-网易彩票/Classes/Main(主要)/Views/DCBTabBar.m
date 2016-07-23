//
//  DCBTabBar.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/19.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBTabBar.h"
#import "DCBTabBarButton.h"

@interface DCBTabBar ()

@property (nonatomic, weak) DCBTabBarButton *selectButton;

@end

@implementation DCBTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        for (int i = 0; i < 5; i++) {
            
            DCBTabBarButton *button = [DCBTabBarButton buttonWithType:UIButtonTypeCustom];
            
            button.tag = i;
            
            UIImage *norImg = [UIImage imageNamed:[NSString stringWithFormat:@"TabBar%d", i + 1]];
            UIImage *selImg = [UIImage imageNamed:[NSString stringWithFormat:@"TabBar%dSel", i + 1]];
            
            [button setImage:norImg forState:UIControlStateNormal];
            [button setImage:selImg forState:UIControlStateDisabled];
            
            [self addSubview:button];
            
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
            
            
            if (i == 0) {
                [self buttonClick:button];
                
            }

            
            button.adjustsImageWhenHighlighted = NO;
        }
    }
    return self;
}

- (void)buttonClick:(DCBTabBarButton *)button
{
    if ([self.delegate respondsToSelector:@selector(tabBar:andTo:)]) {
        
        [self.delegate tabBar:self andTo:button.tag];
    }
    
    self.selectButton.enabled = YES;
    
    button.enabled = NO;
    
    self.selectButton = button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i = 0; i < self.subviews.count; i++) {
        
        UIButton *btn = self.subviews[i];
        
        CGFloat btnY = 0;
        CGFloat btnW = self.frame.size.width / 5;
        CGFloat btnH = self.frame.size.height;
        CGFloat btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        

    }
}

@end
