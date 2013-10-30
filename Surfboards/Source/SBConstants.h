//
//  SBConstants.h
//  AintuCustomer
//
//  Created by Kosuke Hata on 7/6/13.
//  Copyright (c) 2013 Aintu. All rights reserved.
//

#import "KHBase.h"
#import "KHView.h"
#import "KHViewController.h"

#define StringFromBOOL(b) ((b) ? @"YES" : @"NO")
#define IS_IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define GET_IO  [UIApplication sharedApplication].statusBarOrientation

// default macros
#define kZerof 0.0f
#define kPhoneWidth 320.0f
#define kPhoneAdjHeight 460.0f
#define kPhone5AdjHeight 548.0f

#define IS_IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
