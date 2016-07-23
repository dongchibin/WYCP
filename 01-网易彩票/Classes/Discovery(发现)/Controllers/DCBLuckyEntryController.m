//
//  DCBLuckyEntryController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/20.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBLuckyEntryController.h"

@interface DCBLuckyEntryController ()

@property (nonatomic, weak) IBOutlet UIImageView *lightImage;

@end

@implementation DCBLuckyEntryController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.lightImage.animationImages = @[
                                        [UIImage imageNamed:@"lucky_entry_light0"],
                                        [UIImage imageNamed:@"lucky_entry_light1"]
                                        ];
    
    self.lightImage.animationDuration = 1;
    
    self.lightImage.animationRepeatCount = CGFLOAT_MAX;
    
    [self.lightImage startAnimating];
}



@end
