//
// Created by Predrag Cokulov on 1/6/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import "CacheObject.h"
#import "MemCache.h"

@implementation CacheObject
{

}

- (id)initWithObject:(id)object andMaxCacheAge:(long)maxCacheAge
{
    self = [super init];

    if (self)
    {
        _addedTs = currentTimeMillis;
        _maxCacheAge = maxCacheAge;
        _object = object;
    }

    return self;
}

- (BOOL)isExpired
{
    return _addedTs + _maxCacheAge < currentTimeMillis;
}

@end