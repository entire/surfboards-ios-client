//
//  SBMainViewController.h
//  Surfboards
//
//  Created by Kosuke Hata on 10/29/13.
//  Copyright (c) 2013 canopy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBMainViewController : KHViewController <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *boards;

@end
