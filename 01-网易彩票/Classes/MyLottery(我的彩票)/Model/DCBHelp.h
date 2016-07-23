//
//  DCBHelp.h
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/25.
//  Copyright © 2016年 董池彬. All rights reserved.
//

/*
 "title" : "如何提现？",
 "html" : "help.html",
 "id" : "howtowithdraw"
 */

#import <Foundation/Foundation.h>

@interface DCBHelp : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *html;

@property (nonatomic, copy) NSString *ID;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)helpModelWithDict:(NSDictionary *)dict;

@end
