//
//  DCBProductController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/23.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBProductController.h"
#import "DCBProduct.h"
#import "DCBProductCell.h"

@interface DCBProductController ()

@property (nonatomic, strong) NSArray *productArr;

@end

@implementation DCBProductController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(80, 80);
    
    flowLayout.minimumInteritemSpacing = 10;
    
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"DCBProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.productArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DCBProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.cellProduct = self.productArr[indexPath.item];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>



- (NSArray *)productArr
{
    if (!_productArr) {
        
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil]];
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            [arrM addObject:[DCBProduct productModelWithDict:obj]];
        }];
        
        _productArr = arrM;
    }
    return _productArr;
}

@end
