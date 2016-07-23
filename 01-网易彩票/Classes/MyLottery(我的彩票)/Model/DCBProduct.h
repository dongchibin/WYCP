//
//  DCBProduct.h
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/23.
//  Copyright © 2016年 董池彬. All rights reserved.
//

/*
 "title": "网易新闻",
 "stitle":"有态度的新闻客户端",
 "id": "com.netease.news",
 "url": "http://itunes.apple.com/app/id425349261?mt=8",
 "icon": "newsapp",
 "customUrl": "newsapp"
 */

#import <Foundation/Foundation.h>

@interface DCBProduct : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *stitle;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *customUrl;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)productModelWithDict:(NSDictionary *)dict;

@end
