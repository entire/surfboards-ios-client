//
//  SBMainViewController.m
//  Surfboards
//
//  Created by Kosuke Hata on 10/29/13.
//  Copyright (c) 2013 canopy. All rights reserved.
//

#import "SBMainViewController.h"
#import "SBNetworkingManager.h"

@interface SBMainViewController ()

@end

@implementation SBMainViewController {
    BOOL gettingRequest;
}

- (id)init
{
    self = [super init];
    if (self) {
        //...
        gettingRequest = NO;
    }
    return self;
}

- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.y_start, 320, 60)];
    label.text = @"SURFBOARDS";
    label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:25];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.y_start+60, 320, self.height-60)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [view addSubview:self.tableView];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[SBNetworkingManager sharedManager] queryForBoardsWithCompletionBlock:^(NSError *error, NSMutableArray *boards) {
        self.boards = [NSMutableArray arrayWithArray:boards];
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewCell Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.boards.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"CellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"'%@' by %@",
                           self.boards[indexPath.row][@"name"],
                           self.boards[indexPath.row][@"company"]
                           ];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"length: %@  -  thickness: %@  -  width: %@,",
                                   self.boards[indexPath.row][@"length"],
                                   self.boards[indexPath.row][@"thickness"],
                                   self.boards[indexPath.row][@"width"]
                                   ];
    
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
    cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:11];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}

#pragma mark - UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    __block NSMutableArray *newBoards;
    
    if (!gettingRequest) {
        gettingRequest = YES;
        [[SBNetworkingManager sharedManager] queryForBoardsWithCompletionBlock:^(NSError *error, NSMutableArray *boards) {
            if (!error) {
                newBoards = [NSMutableArray arrayWithArray:boards];
                
                if (![newBoards isEqual:self.boards]) {
                    self.boards = newBoards;
                    [self.tableView reloadData];
                }
            }
            gettingRequest = NO;
        }];
    }
}

@end
