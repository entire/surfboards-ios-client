//
//  KHButton.h
//  AintuCustomer
//
//  Created by Kosuke Hata on 7/6/13.
//  Copyright (c) 2013 Aintu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    KHButtonBack,
    KHButtonImage,
    KHButtonNormal,
    kKHButtonTypeMenu,
    kKHButtonTypeLocation,
    kKHButtonTypeBack,
    kKHButtonTypeCancel,
} KHButtonType;

@class KHButton;

@protocol KHButtonDelegate <NSObject>

@required
- (void)buttonWasTouchedUpInside:(KHButton *)button;

@optional
- (void)buttonWasTouchedUpOutside:(KHButton *)button;
- (void)buttonWasTouchedDown:(KHButton *)button;

@end

@interface KHButton : UIView {
    
}

@property (nonatomic, weak) id <KHButtonDelegate> delegate;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) BOOL makeSound;


// for returning quick back buttons
+ (KHButton *)buttonType:(KHButtonType)type withSize:(CGSize)size;

// initialization methods
- (id)initWithButtonSize:(CGSize)size
               withColor:(UIColor *)buttonColor
               withTitle:(NSString *)title;

// setter methods
- (void)setButtonColor:(UIColor *)bgColor;
- (void)setButtonFont:(NSString *)font withSize:(float)size;
- (void)setCornerRadius:(float)cornerRadius;
- (void)setButtonImage:(UIImage *)image;
- (void)setButtonTitle:(NSString *)title;
- (void)setButtonTextColor:(UIColor *)textColor;

// Animation fade in and out
- (void)fadeButtonIn;
- (void)fadeButtonOut;

// change alpha to 1, or 0
- (void)hideButton;
- (void)showButton;

@end