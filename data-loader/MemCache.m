//
// Created by Predrag Cokulov on 1/5/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import "MemCache.h"
#import "CacheObject.h"

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

- (void)addObject:(id)object withKey:(NSString *)key andMaxCacheAge:(long)maxCacheAge
{
    if(object == nil || key == nil)return;
    CacheObject* co = [[CacheObject alloc] initWithObject:object andMaxCacheAge:maxCacheAge];
    _cache[key] = co;
}

- (void)addObject:(id)object withKey:(NSString *)key
{
    [self addObject:object withKey:key andMaxCacheAge:DEF_MAX_CACHE_AGE];
}

- (void)removeObjectWithKey:(NSString *)key
{
    [_cache removeObjectForKey:key];
}

- (void)removeObjectForPattern:(NSRegularExpression *)regex
{
    for(NSString* key in _cache.allKeys)
    {
        NSUInteger regExMatches = [regex numberOfMatchesInString:key options:0 range:NSMakeRange(0, [key length])];
        if(regExMatches != 0)
        {
            [_cache removeObjectForKey:key];
        }
    }
}

- (id)getObjectForKey:(NSString *)key
{
    return _cache[key];
}

- (void)clear
{
    [_cache removeAllObjects];
}


@end