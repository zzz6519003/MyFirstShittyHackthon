//
//  ViewController.m
//  iQuest
//
//  Created by Snowmanzzz on 6/30/14.
//  Copyright (c) 2014 zzz. All rights reserved.
//

#import "ViewController.h"
#import "RQShineLabel.h"

#import "HATransitionController.h"
#import "HACollectionViewSmallLayout.h"
#import "HASmallCollectionViewController.h"
#import "FBShimmering.h"
#import "FBShimmeringView.h"


@interface ViewController ()
@property (strong, nonatomic) RQShineLabel *shineLabel;
@property (strong, nonatomic) UIImageView *wallpaper1;
@property (strong, nonatomic) UIImageView *wallpaper2;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    

    self.wallpaper1 = ({
        UIImageView *imageView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wallpaper1"]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.frame = self.view.bounds;
        imageView;
    });
    [self.view addSubview:self.wallpaper1];
    
    self.wallpaper2 = ({
        UIImageView *imageView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wallpaper2"]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.frame = self.view.bounds;
        imageView.alpha = 0;
        imageView;
    });
    [self.view addSubview:self.wallpaper2];
    
    self.shineLabel = ({
        RQShineLabel *label = [[RQShineLabel alloc] initWithFrame:CGRectMake(16, 16, 320 - 32, CGRectGetHeight(self.view.bounds) - 16)];
        label.numberOfLines = 0;
        label.text = [self.textArray objectAtIndex:self.textIndex];
        label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:24.0];
        label.backgroundColor = [UIColor clearColor];
        [label sizeToFit];
        label.center = self.view.center;
        label;
    });
//    [self.view addSubview:self.shineLabel];
    
    FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] initWithFrame:CGRectMake(16, 16, 320 - 32, CGRectGetHeight(self.view.bounds) - 16)];
    [self.view addSubview:shimmeringView];
    
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:shimmeringView.bounds];
    loadingLabel.textAlignment = NSTextAlignmentCenter;
    loadingLabel.text = NSLocalizedString(@"Shimmer", nil);
    shimmeringView.contentView = self.shineLabel;
    [self.view addSubview:shimmeringView];
    
    // Start shimmering.
    shimmeringView.shimmering = YES;

    UILongPressGestureRecognizer *lp = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self.view addGestureRecognizer:lp];

    

}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.shineLabel shine];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if (self.shineLabel.isVisible) {
        [self.shineLabel fadeOutWithCompletion:^{
            [self changeText];
            [UIView animateWithDuration:2.5 animations:^{
                if (self.wallpaper1.alpha > 0.1) {
                    self.wallpaper1.alpha = 0;
                    self.wallpaper2.alpha = 1;
                }
                else {
                    self.wallpaper1.alpha = 1;
                    self.wallpaper2.alpha = 0;
                }
            }];
            [self.shineLabel shine];
        }];
    }
    else {
        [self.shineLabel shine];
    }
}

- (void)changeText
{
    self.shineLabel.text = self.textArray[(++self.textIndex) % self.textArray.count];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
