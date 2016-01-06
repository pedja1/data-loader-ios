//
// Created by Predrag Cokulov on 1/5/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEF_MAX_CACHE_AGE (24 * 60 * 60 * 60 * 1000l)
#define currentTimeMillis (long)(CFAbsoluteTimeGetCurrent() * 1000)

@interface MemCache : NSObject

+(id)getInstance;

-(id)init;

-(void)addObject: (id)object withKey: (NSString*)key andMaxCacheAge: (long)maxCacheAge;
-(void)addObject: (id)object withKey: (NSString*)key;
-(void)removeObjectWithKey: (NSString*) key;
-(void)removeObjectForPattern: (NSRegularExpression *)regex;
-(id)getObjectForKey: (NSString*)key;
-(void)clear;

@end