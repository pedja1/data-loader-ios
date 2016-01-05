//
// Created by Predrag Cokulov on 1/5/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProvider.h"
#import "Result.h"

@interface Task : NSObject

-(id)initWithProviderList: (NSArray *)providers;

-(void)executeWithOnPreExecute:(void (^)())onPreExecute andOnPostExecute: (void (^)(int status))onPostExecute andOnDataLoaded: (void(^)(Result* result)) onDataLoaded;
-(void)cancel;


@end