//
//  KHBase.m
//  Heavymeta
//
//  Created by Kosuke Hata on 9/18/13.
//  Copyright (c) 2013 Circle Time. All rights reserved.
//

#import "KHBase.h"
#import "KHButton.h"

@implementation KHBase

@synthesize height;
@synthesize width;
@synthesize y_start;
@synthesize x_start;
@synthesize barSize;

+ (KHBase *)getBaseParameters {
    
    KHBase *rect = [[KHBase alloc] init];
    
    if (IS_IPAD) {
        
    } else {
        
        rect.width = 320.0f;
        rect.x_start = 0.0f;
        rect.barSize = kBarHeight;
        
        if (IS_IPHONE_5) {
            rect.height = 548.0f;
        } else {
            rect.height = 460.0f;
        }
        
        if (IS_IOS7) {
            rect.y_start = 20.0f;
        } else {
            rect.y_start = 0.0f;
        }
        
        rect.height += rect.y_start;
    }
    
    return rect;
}

+ (CGRect)getCurrentCGRect {
    
    KHBase *rect = [self getBaseParameters];
    CGRect frame = CGRectMake(0.0f, 0.0f, rect.width, rect.height);
    
    return frame;
}

#pragma mark - Phone Views

+ (UIView *)getNavBarView {
    
    KHBase *rect = [self getBaseParameters];
    
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, rect.width, rect.barSize+rect.y_start)];
    barView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    barView.backgroundColor = kBarColor;
        
    return barView;
}

+ (UIView *)getBaseBarView {
    
    KHBase *rect = [self getBaseParameters];
    
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, rect.y_start, rect.width, rect.barSize)];
    barView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    barView.backgroundColor = kBarColor;
    
    return barView;
}

+ (UILabel *)getNameLabel {
    KHBase *rect = [self getBaseParameters];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(rect.barSize, 0.0f, rect.width-(rect.barSize*2), rect.barSize)];
    nameLabel.textColor = kTextColor;
    nameLabel.autoresizingMask =  UIViewAutoresizingFlexibleWidth;
    nameLabel.font = [UIFont fontWithName:@"TitilliumText25L-250wt" size:17];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    return nameLabel;
}

+ (KHButton *)getMenuButton {
    KHBase *rect = [self getBaseParameters];
    
    KHButton *menuButton = [[KHButton alloc] initWithButtonSize:CGSizeMake(rect.barSize, rect.barSize) withColor:kBarColor withTitle:@""];
    menuButton.frame = CGRectMake(0.0f, 0.0f, rect.barSize, rect.barSize);
    menuButton.tag = kKHButtonTypeMenu;
    [menuButton setCornerRadius:0.0f];
    [menuButton setButtonFont:@"TitilliumText25L-400wt" withSize:12];
    [menuButton setButtonImage:[UIImage imageNamed:@"menu"]];
    
    return menuButton;
}

+ (KHButton *)getLocationButton {
    KHBase *rect = [self getBaseParameters];
    
    KHButton *button = [[KHButton alloc] initWithButtonSize:CGSizeMake(rect.barSize, rect.barSize) withColor:kBarColor withTitle:@""];
    button.frame = CGRectMake(270.0f, 0.0f, rect.barSize, rect.barSize);
    button.tag = kKHButtonTypeLocation;
    [button setCornerRadius:0.0f];
    [button setButtonFont:@"TitilliumText25L-400wt" withSize:12];
    [button setButtonImage:[UIImage imageNamed:@"location"]];
    
    return button;
}

+ (KHButton *)getBackButton {
    KHBase *rect = [self getBaseParameters];

    KHButton *button = [[KHButton alloc] initWithButtonSize:CGSizeMake(rect.barSize, rect.barSize) withColor:kBarColor withTitle:@""];
    button.frame = CGRectMake(0.0f, 0.0f, rect.barSize, rect.barSize);
    button.tag = kKHButtonTypeBack;
    [button setCornerRadius:kZerof];
    [button setButtonFont:@"TitilliumText25L-400wt" withSize:12];
    [button setButtonImage:[UIImage imageNamed:@"back"]];

    return button;
}

+ (KHButton *)getCancelButton {
    KHBase *rect = [self getBaseParameters];
    
    KHButton *button = [[KHButton alloc] initWithButtonSize:CGSizeMake(rect.barSize, rect.barSize) withColor:kBarColor withTitle:@""];
    button.frame = CGRectMake(0.0f, 0.0f, rect.barSize, rect.barSize);
    button.tag = kKHButtonTypeCancel;
    [button setCornerRadius:kZerof];
    [button setButtonFont:@"TitilliumText25L-400wt" withSize:12];
    [button setButtonImage:[UIImage imageNamed:@"cancel"]];
    
    return button;
}

/*
+ (KHButton *)getProfileButton {//RIGHT
    KHBase *rect = [self getBaseParameters];
    
    KHButton *button = [[KHButton alloc] initWithButtonSizeForImage:CGSizeMake(rect.barSize, rect.barSize)];
    button.frame = CGRectMake(260, 0.0f, rect.barSize, rect.barSize);
    button.tag = kKHButtonTypeProfile;
    [button setButtonImage:[UIImage imageNamed:@"profile_icon"]];
    
    return button;
}

+ (KHButton *)getBackButton {//LEFT
    KHBase *rect = [self getBaseParameters];
    
    KHButton *backButton = [KHButton buttonType:kKHButtonTypeBackButton withSize:CGSizeMake(rect.barSize, rect.barSize)];
    backButton.frame = CGRectMake(0.0f, 0.0f, rect.barSize, rect.barSize);
    backButton.tag = kKHButtonTypeBackButton;
    [backButton setButtonImage:[UIImage imageNamed:@"back"]];
    
    return backButton;
}

+ (KHButton *)getAddButton { //RIGHT
    KHBase *rect = [self getBaseParameters];
    
    // setup search button
    KHButton *button = [[KHButton alloc] initWithButtonSizeForImage:CGSizeMake(rect.barSize, rect.barSize)];
    button.frame = CGRectMake(260, 0.0f, rect.barSize, rect.barSize);
    button.tag = kKHButtonTypeAddButton;
    [button setButtonImage:[UIImage imageNamed:@"add_icon"]];
    
    return button;
}

+ (KHButton *)getCancelButton { //LEFT
    KHBase *rect = [self getBaseParameters];
    
    KHButton *button = [[KHButton alloc] initWithButtonSizeForImage:CGSizeMake(rect.barSize, rect.barSize)];
    button.frame = CGRectMake(0, 0, rect.barSize, rect.barSize);
    button.tag = kKHButtonTypeCancelButton;
    [button setButtonImage:[UIImage imageNamed:@"cancel_icon"]];
    
    return button;
}

+ (KHButton *)getOKButton { // RIGHT
    KHBase *rect = [self getBaseParameters];
    
    KHButton *button = [[KHButton alloc] initWithButtonSizeForImage:CGSizeMake(rect.barSize, rect.barSize)];
    button.frame = CGRectMake(260, 0, rect.barSize, rect.barSize);
    button.tag = kKHButtonTypeOKButton;
    [button setButtonImage:[UIImage imageNamed:@"checkmark_icon"]];
    
    return button;
}

+ (UIColor *)baseColor {
    
    UIColor *color;
    
    if (IS_IPAD) {
        color = [UIColor whiteColor];
    } else {
        color = [UIColor veryLightGray];
    }
    
    return color;
}
 */

@end
