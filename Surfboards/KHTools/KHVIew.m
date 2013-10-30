//
//  KHView.m
//  Heavymeta
//
//  Created by Kosuke Hata on 9/17/13.
//  Copyright (c) 2013 Circle Time. All rights reserved.
//

#import "KHView.h"
#import "KHButton.h"
#import "KHBase.h"

@interface KHView ()
@end

@implementation KHView

@synthesize barView = _barView;
@synthesize nameLabel = _nameLabel;
@synthesize leftButton = _leftButton;
@synthesize rightButton = _rightButton;

@synthesize width = _width;
@synthesize height = _height;
@synthesize x_start = _x_start;
@synthesize y_start = _y_start;
@synthesize barSize = _barSize;

#pragma mark - Setup Parameters

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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

- (CGRect)getFullProperRectForView {
    
    CGRect frame = CGRectMake(0.0f, 0.0f, self.width, self.height);
    
    return frame;
}

@end
