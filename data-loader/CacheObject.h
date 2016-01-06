//
// Created by Predrag Cokulov on 1/6/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CacheObject : NSObject

@property long addedTs;
@property id object;
@property long maxCacheAge;

-(id)initWithObject: (id)object andMaxCacheAge: (long) maxCacheAge;
-(BOOL)isExpired;

@end