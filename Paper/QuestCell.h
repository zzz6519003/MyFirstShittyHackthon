//
//  QuestCell.h
//  Paper
//
//  Created by Snowmanzzz on 6/30/14.
//  Copyright (c) 2014 Heberti Almeida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBShimmeringView.h"
@class QuestCell;

@protocol QuestCellDelegate <NSObject>

- (void)questDidAccepted:(QuestCell *)cell withQuestId:(NSInteger) questId;

@end

@interface QuestCell : UICollectionViewCell <FBShimmering>

@property (weak, nonatomic) id<QuestCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
