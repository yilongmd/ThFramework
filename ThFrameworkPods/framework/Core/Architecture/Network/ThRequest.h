//
// Created by syl on 16/4/15.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThRequest.h"
#import "ThMacro.h"
#import "ThHttpRequest.h"

@class ThModel;
@class ThKeyValueStore;

//处理网络访问和缓存
@interface ThRequest : ThHttpRequest {
    ThKeyValueStore *cacheStore;
}

//缓存KeyValue
@DefVar(ThKeyValueStore *,store);

//默认超时时间
@DefAssign(int,IntTimeOut);

//是否适用缓存
@DefAssign(BOOL,isCache);

//考虑如果持续访问时的Cookie
@DefAssign(NSString *,strCookie);


- (void)getWithURLString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure;
@end