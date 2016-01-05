//
//  DataProvider.h
//  data-loader
//
//  Created by Predrag Cokulov on 12/21/15.
//  Copyright © 2015 Predrag Cokulov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataProvider <NSObject>

-(BOOL)load;

-(BOOL)forceLoading;

-(id) getResult;

@end
