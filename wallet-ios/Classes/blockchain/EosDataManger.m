//
//  EosDataManger.m
//  wallet-ios
//
//  Created by fresh on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "EosDataManger.h"

@implementation EosDataManger

+ (instancetype)instance {
    static EosDataManger *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)dealloc {
    ILog(@"EosDataManger dealloc.");
}
@end
