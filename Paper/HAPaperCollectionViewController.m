//
//  HAPaperCollectionViewController.m
//  Paper
//
//  Created by Heberti Almeida on 11/02/14.
//  Copyright (c) 2014 Heberti Almeida. All rights reserved.
//

#import "HAPaperCollectionViewController.h"
#import "HATransitionLayout.h"
#import <AVOSCloud/AVOSCloud.h>
#import "QuestCell.h"

#define MAX_COUNT 20
#define CELL_ID @"CELL_ID"

@interface HAPaperCollectionViewController () <QuestCellDelegate>
@property (nonatomic, strong) NSArray *questArray;
@end


@implementation HAPaperCollectionViewController

- (id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    if (self = [super initWithCollectionViewLayout:layout])
    {
//        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CELL_ID];
        [self.collectionView registerClass:[QuestCell class] forCellWithReuseIdentifier:CELL_ID];
        [self.collectionView registerNib:[UINib nibWithNibName:@"QuestCell" bundle:nil] forCellWithReuseIdentifier:CELL_ID];
        [self.collectionView setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

#pragma mark - Hide StatusBar
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 4;
    cell.clipsToBounds = YES;
    
    QuestCell *qc = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    if (self.questArray.count > 0) {
        qc.titleLabel.text = [((AVObject *)self.questArray[indexPath.row]) objectForKey:@"QuestTitle"];

    }
    qc.delegate = self;
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cell"]];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, cell.bounds.size.width, 20)];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
    label.text = @"do some thing";
    [cell addSubview:label];
    cell.backgroundView = backgroundView;
    
    return qc;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.questArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)point
{
    return nil;
}

- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView
                        transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout
{
    HATransitionLayout *transitionLayout = [[HATransitionLayout alloc] initWithCurrentLayout:fromLayout nextLayout:toLayout];
    return transitionLayout;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Adjust scrollView decelerationRate
    self.collectionView.decelerationRate = self.class != [HAPaperCollectionViewController class] ? UIScrollViewDecelerationRateNormal : UIScrollViewDecelerationRateFast;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadQuest];
}

- (void)loadQuest {
    AVQuery *query = [AVQuery queryWithClassName:@"Quest"];
    NSArray *ar = [query findObjects];
    self.questArray = ar;
    [self.collectionView reloadData];
    
    
    NSLog(@"%d", ar.count);
}

- (void)questDidAccepted:(QuestCell *)cell withQuestId:(NSInteger)questId {
    AVObject *a = self.questArray[questId];
    NSArray *b = @[@"53b7b729e4b0cdeb6e247f94"];
    
}


@end
