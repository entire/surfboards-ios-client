//
//  SBNetworkingManager.h
//  Surfboards
//
//  Created by Kosuke Hata on 10/29/13.
//  Copyright (c) 2013 canopy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SBNetworkingManager;

@interface SBNetworkingManager : NSObject {
    
}

+ (SBNetworkingManager *)sharedManager;

- (void)queryForBoardsWithCompletionBlock:(void (^)(NSError *error, NSMutableArray *boards))completionBlock;

@end
