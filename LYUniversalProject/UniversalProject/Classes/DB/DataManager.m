//
//  DataManager.m
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//


#import "DataManager.h"

@implementation DataManager

+ (id)instance
{
    static DataManager *instance = nil;
    @synchronized (self)
    {
        if (instance == nil)
        {
            instance = [[DataManager alloc] init];
        }
    }
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *databasePath= [[paths objectAtIndex:0] stringByAppendingPathComponent:DataFileName];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if(![fileManager fileExistsAtPath:databasePath]) {
            NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DataFileName];
            [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
        }
        
        self.ettDB = [FMDatabase databaseWithPath:databasePath];
        if (![self.ettDB open]) {
            CLog(@"Could not open db.");
        }
    }
    return self;
}

@end
