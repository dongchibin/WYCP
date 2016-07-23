//
//  DCBSettingCell.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/23.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBSettingCell.h"

@implementation DCBSettingCell

+ (UITableViewCellStyle)cellStyleWithItem:(NSDictionary *)item
{
    UITableViewCellStyle style;
    
    if ([item[DCBCellStyle] isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        
        style = UITableViewCellStyleSubtitle;
        
    }else if ([item[DCBCellStyle] isEqualToString:@"UITableViewCellStyleValue1"]){
        
        style = UITableViewCellStyleValue1;
        
    }else if ([item[DCBCellStyle] isEqualToString:@"UITableViewCellStyleValue2"]){
        
        style = UITableViewCellStyleValue2;
        
    }else{
        
        style = UITableViewCellStyleDefault;
    }
    
    return style;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView andItem:(NSDictionary *)item
{
    static NSString *ID = @"cell";
    
    DCBSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[DCBSettingCell alloc] initWithStyle:[self cellStyleWithItem:item] reuseIdentifier:ID];
    }
    return cell;
}

- (void)setTimeStr:(NSString *)timeStr
{
    _timeStr = timeStr;
    
    self.detailTextLabel.text = timeStr;
    
    NSUserDefaults *faults = [NSUserDefaults standardUserDefaults];
    
    [faults setObject:timeStr forKey:self.item[DCBTimeKey]];
    
    [faults synchronize];
}

- (void)setItem:(NSDictionary *)item
{
    _item = item;
    
    if ([item[DCBIcon] length] > 0) {
        
        self.imageView.image = [UIImage imageNamed:item[DCBIcon]];
    }
    
    self.textLabel.text = item[DCBTitle];
    
    self.detailTextLabel.text = item[DCBSubtitle];
    
    if ([item[DCBHighlight] boolValue]) {
        
        self.detailTextLabel.textColor = [UIColor redColor];
        
    }else{
        
        self.detailTextLabel.textColor = [UIColor blackColor];
    }

    if ([item[DCBTimeKey] length] > 0) {
        
        NSUserDefaults *faults = [NSUserDefaults standardUserDefaults];
        
        NSString *timeStr =  [faults objectForKey:item[DCBTimeKey]];
        
        if (timeStr.length > 0) {
            
            self.detailTextLabel.text = timeStr;
        }
    }

    
    NSString *classStr = item[DCBAccessoryType];
    
    if (classStr.length == 0) {
        
        return;
    }
    
    Class className = NSClassFromString(classStr);
    
    id obj = [[className alloc] init];
    
    if ([obj isKindOfClass:[UIImageView class]]) {
        
        UIImageView *imageView = (UIImageView *)obj;
        
        imageView.image = [UIImage imageNamed:item[DCBAccessoryName]];
        
        [imageView sizeToFit];
        
        self.accessoryView = imageView;
        
    }else if ([obj isKindOfClass:[UISwitch class]]){
        
        UISwitch *switcher = (UISwitch *)obj;
        
        [switcher addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

        switcher.on = [defaults boolForKey:item[DCBKeyName]];
        
        self.accessoryView = switcher;
    }
    
}

- (void)switchChange:(UISwitch *)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setBool:sender.isOn forKey:self.item[DCBKeyName]];
    
    [defaults synchronize];
}

@end
