//
//  DCBAneraController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/19.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBAneraController.h"

@interface DCBAneraController ()

@property (nonatomic, weak) IBOutlet UISegmentedControl *segment;

@end

@implementation DCBAneraController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"NLArenaBackground"].CGImage);
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    [self.segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor whiteColor]
                           };
    
    [self.segment setTitleTextAttributes:dict forState:UIControlStateNormal];
    [self.segment setTitleTextAttributes:dict forState:UIControlStateSelected];
}



@end
