//
//  SBNetworkingManager.m
//  Surfboards
//
//  Created by Kosuke Hata on 10/29/13.
//  Copyright (c) 2013 canopy. All rights reserved.
//

#import "SBNetworkingManager.h"
#import "AFNetworking.h"
#import "AFURLRequestSerialization.h"

@implementation SBNetworkingManager

#pragma mark - Singleton Pattern Setup

+ (SBNetworkingManager *)sharedManager {
    static SBNetworkingManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[SBNetworkingManager alloc] init];
    });
    
    return _sharedManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        //...
    }
    return self;
}

- (void)queryForBoardsWithCompletionBlock:(void (^)(NSError *error, NSMutableArray *boards))completionBlock {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:@"http://shrouded-mesa-3796.herokuapp.com/boards"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSMutableArray *array = responseObject;
             NSLog(@"received response!");
             completionBlock(nil, array);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"error!");
             completionBlock(error, nil);
    }];
}


@end
