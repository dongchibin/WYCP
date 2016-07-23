//
//  DCBHelpCell.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/25.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBHelpCell.h"
#import "DCBHelp.h"

@implementation DCBHelpCell

- (void)setCellHelp:(DCBHelp *)cellHelp
{
    _cellHelp = cellHelp;
    
    self.textLabel.text = cellHelp.title;
}

+ (instancetype)helpCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    
    DCBHelpCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[DCBHelpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
