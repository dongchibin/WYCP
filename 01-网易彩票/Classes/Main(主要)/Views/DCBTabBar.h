//
//  DCBTabBar.h
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/19.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DCBTabBar;

@protocol DCBTabBarDelegate <NSObject>

- (void)tabBar:(DCBTabBar *)tabBar andTo:(NSUInteger)to;

@end

@interface DCBTabBar : UIView

@property (nonatomic, weak) id<DCBTabBarDelegate> delegate;

@end
