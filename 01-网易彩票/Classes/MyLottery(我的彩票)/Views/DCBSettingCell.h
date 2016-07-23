//
//  DCBSettingCell.h
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/23.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DCBHeader            @"DCBHeader"
#define DCBFooter            @"DCBFooter"
#define DCBItems             @"DCBItems"

#define DCBIcon              @"DCBIcon"
#define DCBTitle             @"DCBTitle"
#define DCBAccessoryType     @"DCBAccessoryType"
#define DCBAccessoryName     @"DCBAccessoryName"
#define DCBTargetVc          @"DCBTargetVc"
#define DCBCallFunc          @"DCBCallFunc"
#define DCBPlistName         @"DCBPlistName"
#define DCBSubtitle          @"DCBSubtitle"
#define DCBCellStyle         @"DCBCellStyle"
#define DCBHighlight         @"DCBHighlight"
#define DCBKeyName           @"DCBKeyName"
#define DCBTimeKey           @"DCBTimeKey"

@interface DCBSettingCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView andItem:(NSDictionary *)item;

@property (nonatomic, strong) NSDictionary *item;

@property (nonatomic, copy) NSString *timeStr;

@end
