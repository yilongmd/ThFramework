//
// Created by syl on 16/4/15.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThModel.h"
#import "ThMacro.h"

@interface ThModel (Th)

- (id)ThInitWithString:(NSString *)strJson;

- (id)ThInitWithObject:(id)o;
@end