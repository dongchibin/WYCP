//
//  DCBSettingController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/21.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBSettingController.h"
#import "DCBSettingCell.h"

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

@interface DCBSettingController ()

@property (nonatomic, strong) NSArray *groupArr;

@end

@implementation DCBSettingController

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (void)checkUpdata
{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最新版本" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    
    [alertVc addAction:action];
    
    [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *group = self.groupArr[indexPath.section];
    
    NSArray *items = group[DCBItems];
    
    NSDictionary *selItem = items[indexPath.row];
    
    //检查新版本
    NSString *methodStr = selItem[DCBCallFunc];
    
    SEL selector = NSSelectorFromString(methodStr);
    
    if ([self respondsToSelector:selector]) {
        
        
#pragma clang diagnostic push
        
#pragma clang disagnostic ignored
        
        [self performSelector:selector];
        
#pragma clang diagnostic pop
    }
    
    //兑换码控制器
    
    NSString *targetVc = selItem[DCBTargetVc];
    
    if (targetVc.length == 0) {
        return;
    }
    
    Class className = NSClassFromString(targetVc);
    
    UIViewController *obj = [[className alloc] init];
    
    obj.navigationItem.title = selItem[DCBTitle];
    
    //如果对象是settingVc类型的对象,需要加载plist类型的文件
    if ([obj isKindOfClass:[DCBSettingController class]]) {
        
        //强转
        DCBSettingController *settingXXX = (DCBSettingController *)obj;
        
        settingXXX.plistName = selItem[DCBPlistName];
        
        [self.navigationController pushViewController:obj animated:YES];
        
    }else{
        
        [self.navigationController pushViewController:obj animated:YES];
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groupArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *group = self.groupArr[section];
    
    NSArray *items = group[DCBItems];
    
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *group = self.groupArr[indexPath.section];
    
    NSArray *items = group[DCBItems];
    
    NSDictionary *item = items[indexPath.row];
    
    DCBSettingCell *cell = [DCBSettingCell cellWithTableView:tableView andItem:item];
    
    cell.item = item;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *group = self.groupArr[section];
    
    return group[DCBHeader];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSDictionary *group = self.groupArr[section];
    
    return group[DCBFooter];
}

- (NSArray *)groupArr
{
    if (!_groupArr) {
        _groupArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.plistName ofType:nil]];
    }
    return _groupArr;
}


@end
