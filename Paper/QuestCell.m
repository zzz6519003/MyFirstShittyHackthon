//
//  QuestCell.m
//  Paper
//
//  Created by Snowmanzzz on 6/30/14.
//  Copyright (c) 2014 Heberti Almeida. All rights reserved.
//

#import "QuestCell.h"
#import <AVOSCloud/AVOSCloud.h>

@implementation QuestCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cell"]];
    self.backgroundView = backgroundView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (IBAction)accept:(id)sender {
    [sender setTitle:@"Accepted" forState:UIControlStateNormal];
    if (self.delegate && [self.delegate respondsToSelector:@selector(questDidAccepted:withQuestId:)]) {
        [self.delegate questDidAccepted:self withQuestId:self.tag];
    }
//        NSLog(@"crap");
        //    NSIndexPath *path = [self.collectionView indexPathForCell:(UICollectionViewCell *)[[sender superview] superview]];
        //    NSLog(@"%d", path.row);
    

}

@end
