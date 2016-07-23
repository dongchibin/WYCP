//
//  DCBProductCell.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/23.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBProductCell.h"
#import "DCBProduct.h"

@interface DCBProductCell ()

@property (nonatomic, weak) IBOutlet UIImageView *iconView;

@property (nonatomic, weak) IBOutlet UILabel *label;

@end

@implementation DCBProductCell

- (void)setCellProduct:(DCBProduct *)cellProduct
{
    _cellProduct = cellProduct;
    
    self.iconView.image = [UIImage imageNamed:cellProduct.icon];
    
    self.label.text = cellProduct.title;
}

- (void)awakeFromNib
{
    self.iconView.layer.cornerRadius = 10;
    
    self.iconView.layer.masksToBounds = YES;
}

@end
