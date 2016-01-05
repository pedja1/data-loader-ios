//
//  data_loader.h
//  data-loader
//
//  Created by Predrag Cokulov on 12/21/15.
//  Copyright © 2015 Predrag Cokulov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadDelegate.h"

@interface DataLoader : NSObject

@property (strong, nonatomic) id <LoadDelegate> loadDelegate;
@property (strong, nonatomic) NSArray* providers;

-(id)initWithLoadDelegate: (id <LoadDelegate>) delegate andDataProviders: (NSArray *) providers;
-(id)initWithLoadDelegate: (id <LoadDelegate>) delegate;
-(id)initWithDataProviders: (NSArray *)providers;
-(id)init;

-(Result *)loadData: (BOOL)forceSyncExecution;
-(Result *)loadData;
-(void)cancel;

@end
