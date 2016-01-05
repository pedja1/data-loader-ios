//
// Created by Predrag Cokulov on 1/5/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import "Result.h"

@implementation Result
{

}

@synthesize status = _status;
@synthesize data = _data;
@synthesize provider = _provider;

- (id)initWithStatus:(int)status andData:(id)data andProvider:(id <DataProvider>)provider
{
    self = [super init];
    if (self)
    {
        _status = status;
        _data = data;
        _provider = provider;
    }
    return self;
}

@end