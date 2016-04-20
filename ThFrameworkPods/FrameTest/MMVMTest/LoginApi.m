//
//  LoginApi.m
//  ThFrameworkPods
//
//  Created by syl on 16/4/19.
//  Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "LoginApi.h"

@implementation LoginApi {
    NSString *_username;
    NSString *_password;
}
- (id)initWithLoginUser:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _username = username;
        _password = password;
    }
    return self;
}

- (NSString *)requestUrl {
    // “http://www.yuantiku.com” 在 YTKNetworkConfig 中设置，这里只填除去域名剩余的网址信息
    return @"/UserInface/login";
}


- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
            @"username": _username,
            @"password": _password
    };
}

@end
