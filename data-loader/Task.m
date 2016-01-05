//
// Created by Predrag Cokulov on 1/5/16.
// Copyright (c) 2016 Predrag Cokulov. All rights reserved.
//

#import "Task.h"

@interface Task ()

@property (atomic) BOOL executed;
@property (atomic) BOOL cancelled;

@end

@implementation Task
{
}

NSArray* _providers;

- (id)initWithProviderList:(NSArray *)providers
{
    self = [super init];

    if(self)
    {
        _providers = providers;
    }

    if(_providers == nil || [_providers count] == 0)
    {
        @throw [NSException
                exceptionWithName:@"NSInvalidArgumentException"
                           reason:@"'providers' array cannot be 'nil' or empty."
                         userInfo:nil];
    }

    return self;
}

- (void)executeWithOnPreExecute:(void (^)())onPreExecute andOnPostExecute:(void (^)(int status))onPostExecute andOnDataLoaded:(void (^)(Result* result))onDataLoaded
{
    if(_cancelled)
        return;
    if(_executed)
    {
        @throw [NSException
                exceptionWithName:@"NSInvalidStateException"
                           reason:@"You can only execute one instance of a 'Task' one time"
                         userInfo:nil];
    }
    _executed = true;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(void)
    {
        if(_cancelled)
            return;
        int status;
        dispatch_async(dispatch_get_main_queue(), ^(void)
        {
            onPreExecute();
        });

        BOOL anySucceeded = false;
        for(id <DataProvider> provider in _providers)
        {
            if(_cancelled)
                return;
            if(anySucceeded && ![provider forceLoading])
                continue;
            BOOL success = [provider load];
            if(success)
            {
                id result = [provider getResult];
                anySucceeded = true;
                onDataLoaded([[Result alloc] initWithStatus:STATUS_OK andData:result andProvider:provider]);
            }
        }
        status = anySucceeded ? STATUS_OK : STATUS_ERROR;
        if(_cancelled)
            return;

        dispatch_async(dispatch_get_main_queue(), ^(void)
        {
            onPostExecute(status);
        });
    });

}

- (void)cancel
{
    _cancelled = true;
}


@end