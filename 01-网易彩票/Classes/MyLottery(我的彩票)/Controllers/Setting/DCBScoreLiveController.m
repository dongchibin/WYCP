//
//  DCBScoreLiveController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/23.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBScoreLiveController.h"
#import "DCBSettingCell.h"

@interface DCBScoreLiveController ()

@property (nonatomic, strong) UIDatePicker *dataPicker;

@property (nonatomic, strong) UITextField *field;

@property (nonatomic, strong) UIToolbar *toobar;

@property (nonatomic, strong) DCBSettingCell *selectCell;

@end

@implementation DCBScoreLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (UIDatePicker *)dataPicker
{
    if (!_dataPicker) {
        
        _dataPicker = [[UIDatePicker alloc] init];
        
        _dataPicker.datePickerMode = UIDatePickerModeTime;
        
        _dataPicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    }
    return _dataPicker;
}

- (UIToolbar *)toobar
{
    if (!_toobar) {
        
        _toobar = [[UIToolbar alloc] init];
        
        _toobar.frame = CGRectMake(0, 0, 0, 44);
        
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
        
        UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
        
        _toobar.items = @[cancel, flexItem, done];
    }
    return _toobar;
}

- (void)cancel
{
    [self.view endEditing:YES];
}

- (void)done
{
    NSDate *date = self.dataPicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"HH:mm";
    
    NSString *timeStr = [formatter stringFromDate:date];
    
//    self.selectCell.detailTextLabel.text = timeStr;
    self.selectCell.timeStr = timeStr;
    
    [self.view endEditing:YES];
}

- (UITextField *)field
{
    if (!_field) {
        
        _field = [[UITextField alloc] init];
        
        _field.inputView = self.dataPicker;
        
        _field.inputAccessoryView = self.toobar;
    }
    return _field;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        
        return;
    }
    
    DCBSettingCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [cell.contentView addSubview:self.field];
    
    self.selectCell = cell;
    
    [self.field becomeFirstResponder];
}

@end
