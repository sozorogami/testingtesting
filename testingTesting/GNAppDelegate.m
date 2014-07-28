//
//  GNAppDelegate.m
//  testingTesting
//
//  Created by Tyler Tape on 7/28/14.
//  Copyright (c) 2014 Gunosy Inc. All rights reserved.
//

#import "GNAppDelegate.h"
#import "GNHogeViewController.h"

@implementation GNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [GNHogeViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
