//
//  QuestCell.h
//  Paper
//
//  Created by Snowmanzzz on 6/30/14.
//  Copyright (c) 2014 Heberti Almeida. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QuestCell;

@protocol QuestCellDelegate <NSObject>

- (void)questDidAccepted:(QuestCell *)cell withQuestId:(NSInteger) questId;

@end

@interface QuestCell : UICollectionViewCell

@property (weak, nonatomic) id<QuestCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
