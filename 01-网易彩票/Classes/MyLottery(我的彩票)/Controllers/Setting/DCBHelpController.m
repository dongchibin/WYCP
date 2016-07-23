//
//  DCBHelpController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/25.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBHelpController.h"
#import "DCBHelp.h"
#import "DCBHelpCell.h"
#import "DCBWebViewController.h"

@interface DCBHelpController ()

@property (nonatomic, strong) NSArray *helpArr;

@end

@implementation DCBHelpController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCBHelp *cellHelp = self.helpArr[indexPath.row];
    
    DCBWebViewController *webVc = [[DCBWebViewController alloc] init];
    
    webVc.cellHelp = cellHelp;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:webVc];
    
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.helpArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DCBHelpCell *cell = [DCBHelpCell helpCellWithTableView:tableView];
    
    DCBHelp *cellHelp = self.helpArr[indexPath.row];
    
    cell.cellHelp = cellHelp;
    
    return cell;
}

- (NSArray *)helpArr
{
    if (!_helpArr) {
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil]] options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            [arrM addObject:[DCBHelp helpModelWithDict:obj]];
            
        }];
        _helpArr = arrM;
    }
    return _helpArr;
}

@end
