//
//  DCBProduct.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/23.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBProduct.h"

/*
 "title": "网易新闻",
 "stitle":"有态度的新闻客户端",
 "id": "com.netease.news",
 "url": "http://itunes.apple.com/app/id425349261?mt=8",
 "icon": "newsapp",
 "customUrl": "newsapp"
 */

@implementation DCBProduct

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.ID = dict[@"id"];
        self.url = dict[@"url"];
        self.icon = dict[@"icon"];
        self.customUrl = dict[@"customUrl"];
    }
    return self;
}

+ (instancetype)productModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
