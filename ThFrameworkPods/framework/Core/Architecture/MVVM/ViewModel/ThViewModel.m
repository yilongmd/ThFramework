//
// Created by syl on 16/4/14.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "ThViewModel.h"
#import "ThModel.h"
#import "ThRequest.h"
#import "ThJSON.h"


@implementation ThViewModel {

}

- (instancetype)init {
    self = [super init];
    if (self) {
//        //初始化的时候先绑定监听
//        [self bindViewModel];
    }

    return self;
}

- (ThRequest *)getRequest {
    return [[ThRequest alloc] init];
}


- (void)bindViewModel {

}


//请求网络
- (void)getData {

}


@end