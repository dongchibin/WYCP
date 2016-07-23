//
//  DCBHelpCell.h
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/25.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DCBHelp;

@interface DCBHelpCell : UITableViewCell

@property (nonatomic, strong) DCBHelp *cellHelp;

+ (instancetype)helpCellWithTableView:(UITableView *)tableView;

@end
