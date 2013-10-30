//
//  KHViewController.m
//  Heavymeta
//
//  Created by Kosuke Hata on 9/18/13.
//  Copyright (c) 2013 Circle Time. All rights reserved.
//

#import "KHViewController.h"

@interface KHViewController ()

@end

@implementation KHViewController

@synthesize barView;
@synthesize nameLabel;
@synthesize leftButton;
@synthesize rightButton;

@synthesize height;
@synthesize width;
@synthesize y_start;
@synthesize x_start;
@synthesize barSize;


- (id)init
{
    self = [super init];
    if (self) {
        KHBase *base = [KHBase getBaseParameters];
        
        self.height = base.height;
        self.width = base.width;
        self.y_start = base.y_start;
        self.x_start = base.x_start;
        self.barSize = base.barSize;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (IS_IOS7) {
        [self setNeedsStatusBarAppearanceUpdate];
    }
}


@end
