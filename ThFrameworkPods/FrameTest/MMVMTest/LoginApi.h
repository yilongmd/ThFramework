//
//  LoginApi.h
//  ThFrameworkPods
//
//  Created by syl on 16/4/19.
//  Copyright (c) 2016 Tihom-syl. All rights reserved.
//



#import "YTKRequest.h"

@interface LoginApi : YTKRequest


- (id)initWithLoginUser:(NSString *)username password:(NSString *)password;

@end
