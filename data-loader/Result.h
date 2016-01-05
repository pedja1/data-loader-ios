//
// Created by Predrag Cokulov on 1/5/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProvider.h"

#define STATUS_OK 1001
#define STATUS_ERROR 1002

@interface Result : NSObject

@property (readonly) int status;
@property (readonly) id data;
@property (readonly) id <DataProvider> provider;

-(id)initWithStatus: (int)status andData: (id) data andProvider: (id <DataProvider>) provider;

@end