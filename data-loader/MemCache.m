//
// Created by Predrag Cokulov on 1/5/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import "MemCache.h"

@interface MemCache ()

@property (atomic, strong) NSMutableDictionary *cache;

@end

@implementation MemCache
{

}

+ (id)getInstance
{
    static MemCache *instance = nil;
    @synchronized(self)
    {
        if (instance == nil)
            instance = [[self alloc] init];
    }
    return instance;
}

- (id)init
{
    self = [super init];

    if(self)
    {
        _cache = [[NSMutableDictionary alloc] initWithCapacity:100];
    }

    return self;
}


@end