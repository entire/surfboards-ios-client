//
//  KHNavigationController.m
//  AintuCustomer
//
//  Created by Kosuke Hata on 10/17/13.
//  Copyright (c) 2013 Aintu. All rights reserved.
//

#import "KHNavigationController.h"
#import "ATVideoCommercialViewController.h"

@interface KHNavigationController ()

@end

@implementation KHNavigationController

#pragma mark - Orientation Methods for Navigation Controller

- (BOOL)shouldAutorotate {
    
    if (IS_IPAD) {
        return YES;
        
    } else {
        if ([self.visibleViewController isKindOfClass:[ATVideoCommercialViewController class]]) {
            return YES;
        } else {
            return NO;
        }
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)io {
    
    if (IS_IPAD) {
        return YES;
        
    } else {
        if ([self.visibleViewController isKindOfClass:[ATVideoCommercialViewController class]]) {
            return YES;
        } else {
            return (io == UIInterfaceOrientationPortrait);
        }
    }
}

- (NSUInteger)supportedInterfaceOrientations {
    if (IS_IPAD) {
        return (UIInterfaceOrientationMaskAll);
        
    } else {
        if ([self.visibleViewController isKindOfClass:[ATVideoCommercialViewController class]]) {
            return (UIInterfaceOrientationMaskAll);
        } else {
            return UIInterfaceOrientationMaskPortrait;
        }
    }
}

@end
