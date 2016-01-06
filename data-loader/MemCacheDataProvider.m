//
// Created by Predrag Cokulov on 1/6/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import "MemCacheDataProvider.h"
#import "MemCache.h"

@implementation MemCacheDataProvider
{

}
- (id)initWithKey:(NSString *)key
{
    self = [super init];

    if(self)
    {
        _key = key;
    }

    return self;
}

- (id)init
{
    @throw [NSException
            exceptionWithName:@"NSInvalidStateException"
                       reason:@"'key' parameter is required. Use 'initWithKey'"
                     userInfo:nil];
}


- (BOOL)load
{
    _result = [[MemCache getInstance] getObjectForKey:_key];
    return _result != nil;
}

- (BOOL)forceLoading
{
    return NO;
}

- (id)getResult
{
    return _result;
}

@end