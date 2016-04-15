//
// Created by syl on 16/4/15.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "ThRequest.h"
#import "ThModel.h"
#import "ThKeyValueStore.h"
#import "AFHTTPSessionManager.h"
#import "NSString+UrlToKey.h"


@implementation ThRequest {

    NSString *cacheTableName;
}



- (instancetype)init {
    self = [super init];
    if (self) {

        //初始化缓存数据库
        cacheStore = [[ThKeyValueStore alloc] initDBWithName:@"thnetwork.db"];
        cacheTableName = @"thnetwork_cache";
        [cacheStore createTableWithName:cacheTableName];
        //如果没有设置默认10秒超时
        _IntTimeOut = 10;
        //如果没有设置默认不适用缓存
        _isCache = NO;
//        if (_isCache) {
//            id responseObject = [cacheStore getObjectById:[URLString UrlToKey] fromTable:cacheStore];
//
//        } else {
//
//        }
    }

    return self;
}





#pragma mark -- GET请求 --
- (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(id))success
                 failure:(void (^)(NSError *))failure {
    //检查网络状态
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            //如果没有网络,加载缓存
            if (_isCache) {
                //访问成功如果需要缓存就把当前的数据存储到缓存里
                NSString *strUrlKey = [URLString UrlToKey];
                id responseObject = [cacheStore getObjectById:[URLString UrlToKey] fromTable:cacheStore];
                if (responseObject) {
                    success(responseObject);
                }
            }
            //如果没有网络,再怎么都要报错.
            NSError *netError = [NSError errorWithDomain:@"AFNetworkReachabilityStatusNotReachable" code:AFNetworkReachabilityStatusNotReachable userInfo:nil];
            failure(netError);
        } else {
            [[AFNetworkReachabilityManager sharedManager] startMonitoring];

            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            /**
             *  可以接受的类型
             */
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            /**
             *  请求队列的最大并发数
             */
            manager.operationQueue.maxConcurrentOperationCount = 5;
            /**
             *  请求超时的时间
             */
            manager.requestSerializer.timeoutInterval = _IntTimeOut;
            [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    //如果访问成功
                    if (_isCache) {
                        //访问成功如果需要缓存就把当前的数据存储到缓存里
                        NSString *strUrlKey = [URLString UrlToKey];
                        [cacheStore putObject:responseObject withId:strUrlKey intoTable:cacheTableName];
                    }
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    //如果访问出现网络问题等
                    failure(error);
                }
            }];
        }
    }];
}




@end