//
// Created by syl on 16/4/15.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThModel.h"
#import "ThMacro.h"

@class YTKBaseRequest;

@interface ThModel (Th)

- (id)ThInitWithString:(NSString *)strJson;

- (id)ThInitWithRequest:(YTKBaseRequest *)request;

- (id)ThInitWithObject:(id)o;
@end