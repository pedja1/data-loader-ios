//
// Created by Predrag Cokulov on 1/6/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProvider.h"

@interface MemCacheDataProvider : NSObject <DataProvider>

@property (strong) NSString *key;
@property (strong) id result;

-(id)initWithKey: (NSString *)key;
-(id)init;

@end