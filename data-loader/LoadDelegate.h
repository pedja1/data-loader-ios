//
// Created by Predrag Cokulov on 1/5/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Result.h"

@protocol LoadDelegate <NSObject>

-(void)onLoadingFinished: (int)responseStatus;

-(void)onLoadingStarted;

-(void)onDataLoaded: (Result*) result;

@end