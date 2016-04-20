//
// Created by syl on 16/4/15.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "ThModel+Th.h"
#import "ThJSON.h"
#import "YTKBaseRequest.h"


@implementation ThModel (Th)

-(id)ThInitWithString:(NSString *)strJson {
    JSONModelError *jsonError = nil;

    @try {
        [self initWithString:strJson error:&jsonError];
        if (jsonError != nil) {
            DLog(@"%@",jsonError);
        } else {
            self.strData = strJson;
            self.intChanged = @(self.intChanged.intValue + 1);
        }
    }
    @catch (NSException *exception) {
        ALog(@"Exception occurred: %@, %@", exception, [exception userInfo]);
        ALog(@"JSON Error: %d, %@", jsonError.code, jsonError.domain);

    }
    return self;
}

-(id)ThInitWithRequest:(YTKBaseRequest *)request {
    JSONModelError *jsonError = nil;
    @try {
        [self initWithString:request.responseString error:&jsonError];
        if (jsonError != nil) {
            DLog(@"%@",jsonError);
        } else {
            self.strData = request.responseString;
            self.dicdata = (NSDictionary *)request.responseJSONObject;
            self.data = request.responseJSONObject;
            self.intChanged = @(self.intChanged.intValue + 1);
        }
    }
    @catch (NSException *exception) {
        ALog(@"Exception occurred: %@, %@", exception, [exception userInfo]);
        ALog(@"JSON Error: %d, %@", jsonError.code, jsonError.domain);

    }
    return self;
}

-(id)ThInitWithObject:(id)o {
    JSONModelError *jsonError = nil;
    @try {
        NSString *strJson = [ThJSON dictOrArrayToJSONString:o];
        [self initWithString:strJson error:&jsonError];
        if (jsonError != nil) {
            DLog(@"%@",jsonError);
        } else {
            self.strData = strJson;
            self.data = o;
            self.intChanged = @(self.intChanged.intValue + 1);
        }
    }
    @catch (NSException *exception) {
        ALog(@"Exception occurred: %@, %@", exception, [exception userInfo]);
        ALog(@"JSON Error: %d, %@", jsonError.code, jsonError.domain);
    }
    return self;
}
@end