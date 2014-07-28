//
//  GNHogeViewControllerSpec.m
//  testingTesting
//
//  Created by Tyler Tape on 7/29/14.
//  Copyright 2014 Gunosy Inc. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GNHogeViewController.h"

void presentViewControllerInNavigationController(UIViewController *vc) {
    UINavigationController *navigationController =
        [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
    [UIApplication sharedApplication].delegate.window.rootViewController = navigationController;
    [navigationController presentViewController:vc animated:NO completion:nil];
}

SPEC_BEGIN(GNHogeViewControllerSpec)

describe(@"GNHogeViewController", ^{
    __block GNHogeViewController *hogeVC;
    context(@"when it has been initialized", ^{
        beforeEach(^{
            hogeVC = [GNHogeViewController new];
        });
        it(@"should not be nil", ^{
            [[hogeVC shouldNot] beNil];
        });

        describe(@"-viewDidLoad", ^{

            beforeEach(^{
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
            });
            afterEach(^{
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
            });

            context(@"if a username has been set in user defaults", ^{
                beforeEach(^{
                    [[NSUserDefaults standardUserDefaults] setObject:@"フガ" forKey:@"username"];
                    [hogeVC view];
                });
                it(@"greets the user by that name", ^{
                    [[hogeVC.greetingLabel.text should] equal:@"こんにちは、フガさん!"];
                });
            });

            context(@"if a username has not been set in user defaults", ^{
                it(@"greets the user by a default name", ^{
                    [hogeVC view];
                    [[hogeVC.greetingLabel.text should] equal:@"こんにちは、ピヨさん!"];
                });
            });
        });

        describe(@"-viewDidAppear", ^{
            __block void (^animationBlock)(void);
            __block void (^completionBlock)(void);
            beforeEach(^{
                KWCaptureSpy *animationSpy = [UIView captureArgument:@selector(animateWithDuration:animations:completion:)
                                                             atIndex:1];
                KWCaptureSpy *completionSpy = [UIView captureArgument:@selector(animateWithDuration:animations:completion:)
                                                              atIndex:2];
                presentViewControllerInNavigationController(hogeVC);
                animationBlock = animationSpy.argument;
                completionBlock = completionSpy.argument;
            });
            it(@"fades in the image view", ^{
                animationBlock();
                [[theValue(hogeVC.hogeImageView.alpha) should] equal:@1];
            });
            it(@"shows an inspirational message", ^{
                UIAlertView *alertViewMock = [UIAlertView mock];
                [UIAlertView stub:@selector(alloc) andReturn:alertViewMock];
                [alertViewMock stub:@selector(initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:)
                          andReturn:alertViewMock];
                [[alertViewMock should] receive:@selector(show)];
                completionBlock();
            });
        });
    });
});

SPEC_END
