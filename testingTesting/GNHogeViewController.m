//
//  GNHogeViewController.m
//  testingTesting
//
//  Created by Tyler Tape on 7/28/14.
//  Copyright (c) 2014 Gunosy Inc. All rights reserved.
//

#import "GNHogeViewController.h"

@implementation GNHogeViewController

#pragma mark - UIViewController Method Overrides

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"] ?: @"ピヨ";
    self.greetingLabel.text = [NSString stringWithFormat:@"こんにちは、%@さん!", username];

    self.hogeImageView.image = [UIImage imageNamed:@"logo.png"];
    self.hogeImageView.contentMode = UIViewContentModeScaleToFill;
    self.hogeImageView.alpha = 0.f;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:3.0 animations:^{
        self.hogeImageView.alpha = 1.f;
        self.hogeImageView.frame = CGRectMake(60.f, 350.f, 200.f, 120.f);
    } completion:^(BOOL finished) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"一言"
                                                          message:@"今日もほげほげしく生きましょう！"
                                                         delegate:nil
                                                cancelButtonTitle:@"(^―^)"
                                                otherButtonTitles:nil];
        [alert show];
    }];
}

@end
