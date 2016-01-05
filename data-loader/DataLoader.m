//
//  data_loader.m
//  data-loader
//
//  Created by Predrag Cokulov on 12/21/15.
//  Copyright © 2015 Predrag Cokulov. All rights reserved.
//

#import "DataLoader.h"
#import "Task.h"

@implementation DataLoader

Task* task;

@synthesize loadDelegate = _loadDelegate;
@synthesize providers = _providers;

- (id)initWithLoadDelegate:(id <LoadDelegate>)delegate andDataProviders:(NSArray *)providers
{
    self = [super init];
    if (self)
    {
        _loadDelegate = delegate;
        _providers = providers;
    }
    return self;
}

- (id)initWithLoadDelegate:(id <LoadDelegate>)delegate
{
    return [self initWithLoadDelegate:delegate andDataProviders:nil];
}

- (id)initWithDataProviders:(NSArray *)providers
{
    return [self initWithLoadDelegate:nil andDataProviders:providers];
}

- (id)init
{
    return [self initWithLoadDelegate:nil andDataProviders:nil];;
}

- (Result *)loadData:(BOOL)forceSyncExecution
{
    if (!forceSyncExecution)
    {
        task = [[Task alloc] initWithProviderList:_providers];
        [task executeWithOnPreExecute:^()
        {
            if ([_loadDelegate respondsToSelector:@selector(onLoadingStarted)])
            {
                [_loadDelegate onLoadingStarted];
            }
        } andOnPostExecute:^(int status)
        {
            if ([_loadDelegate respondsToSelector:@selector(onLoadingFinished:)])
            {
                [_loadDelegate onLoadingFinished:status];
            }
        } andOnDataLoaded:^(Result* result)
        {
            if ([_loadDelegate respondsToSelector:@selector(onDataLoaded:)])
            {
                [_loadDelegate onDataLoaded:result];
            }
        }];
    }
    else
    {
        for(id <DataProvider> provider : _providers)
        {
            BOOL success = [provider load];
            if(success)
            {
                id result = [provider getResult];
                return [[Result alloc] initWithStatus:STATUS_OK andData:result andProvider:provider];
            }
        }
        return [[Result alloc] initWithStatus:STATUS_ERROR andData:nil andProvider:nil];
    }
    return nil;
}

- (Result *)loadData
{
    return [self loadData:false];
}

- (void)cancel
{
    if(task != nil)
    {
        [task cancel];
    }
}


@end
