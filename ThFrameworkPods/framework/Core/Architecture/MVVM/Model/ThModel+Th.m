//
// Created by syl on 16/4/15.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "ThModel+Th.h"
#import "ThJSON.h"


@implementation ThModel (Th)

-(id)ThInitWithString:(NSString *)strJson {
    JSONModelError *jsonError = nil;
    [self initWithString:strJson error:&jsonError];
    if (jsonError != nil) {
        DLog(@"%@",jsonError);
    } else {
        self.strData = strJson;
    }
    return self;
}

-(id)ThInitWithObject:(id)o {
    NSString *strJson = [ThJSON dictOrArrayToJSONString:o];
    JSONModelError *jsonError = nil;
    [self initWithString:strJson error:&jsonError];
    if (jsonError != nil) {
        DLog(@"%@",jsonError);
    } else {
        self.strData = strJson;
        self.data = o;
    }
    return self;
}
@end