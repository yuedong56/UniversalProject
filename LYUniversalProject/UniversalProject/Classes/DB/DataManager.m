//
//  DataManager.m
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//


#import "DataManager.h"
#import <FMDB/FMDatabaseQueue.h>
#import <FMDB/FMDatabase.h>

@interface DataManager ()

@property(strong, nonatomic) FMDatabaseQueue *databaseQueue;

@end



@implementation DataManager

+ (instancetype)instance
{
    static DataManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *toPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:DataFileName];
        if (![[NSFileManager defaultManager] fileExistsAtPath:toPath]) {
            NSString *fromPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DataFileName];
            [[NSFileManager defaultManager] copyItemAtPath:fromPath toPath:toPath error:nil];
        }
        
        self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:toPath];
        [self.databaseQueue inDatabase:^(FMDatabase *db) {
            [db setMaxBusyRetryTimeInterval:5];
        }];
    }
    return self;
}



@end
