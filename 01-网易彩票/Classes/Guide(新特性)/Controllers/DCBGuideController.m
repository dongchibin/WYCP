//
//  DCBGuideController.m
//  01-网易彩票
//
//  Created by 彬彬哥哥^_^ on 16/6/25.
//  Copyright © 2016年 董池彬. All rights reserved.
//

#import "DCBGuideController.h"
#import "DCBGuideCell.h"

@interface DCBGuideController ()

@property (nonatomic, strong) NSArray<UIImage *> *bjImgArr;

@property (nonatomic, weak) UIImageView *adView;

@property (nonatomic, weak) UIImageView *bigTextView;

@property (nonatomic, weak) UIImageView *smallTextView;

@end

@implementation DCBGuideController

- (instancetype)init
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    
    flowLayout.minimumLineSpacing = 0;
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return  [super initWithCollectionViewLayout:flowLayout];
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor magentaColor];
    
    self.collectionView.bounces = NO;
    
    self.collectionView.pagingEnabled = YES;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    [self.collectionView registerClass:[DCBGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setupUI];
}

- (void)setupUI
{
    UIImageView *waveLineView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    
    waveLineView.x = -200;
    
    [self.collectionView addSubview:waveLineView];
    
    UIImageView *adView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    
    self.adView = adView;
    
    [self.collectionView addSubview:adView];
    
    UIImageView *bigTextView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    
    bigTextView.y = self.collectionView.height * 0.7;
    
    self.bigTextView = bigTextView;
    
    [self.collectionView addSubview:bigTextView];
    
    UIImageView *smallTextView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    
    smallTextView.y = self.collectionView.height * 0.8;
    
    self.smallTextView = smallTextView;
    
    [self.collectionView addSubview:smallTextView];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    
    CGFloat offsetX = offset.x;
    
    NSInteger pageNum = offsetX / scrollView.width;
    
    self.adView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%@", @(pageNum + 1)]];
    
    self.bigTextView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%@", @(pageNum + 1)]];
    
    self.smallTextView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%@", @(pageNum + 1)]];
    
    CGFloat startX;
    
    if (self.adView.x > offsetX) {
        
        startX = offsetX - scrollView.width;
        
    }else{
        
        startX = offsetX + scrollView.width;
    }
    
    self.adView.x = startX;
    self.bigTextView.x = startX;
    self.smallTextView.x = startX;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.adView.x = offsetX;
        self.bigTextView.x = offsetX;
        self.smallTextView.x = offsetX;
        
    }];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.bjImgArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DCBGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.contentView.layer.contents = (__bridge id _Nullable)(self.bjImgArr[indexPath.item].CGImage);
    
    if (indexPath.item == self.bjImgArr.count - 1) {
        
        cell.startBtn.hidden = NO;
    }
    
    return cell;
}

- (NSArray *)bjImgArr
{
    if (!_bjImgArr) {
        
        _bjImgArr = @[
                      [UIImage imageNamed:@"guide1Background"],
                      [UIImage imageNamed:@"guide2Background"],
                      [UIImage imageNamed:@"guide3Background"],
                      [UIImage imageNamed:@"guide4Background"]
                      ];
    }
    return _bjImgArr;
}

@end
