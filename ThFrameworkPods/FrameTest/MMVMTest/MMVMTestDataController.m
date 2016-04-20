//
//  MMVMTestDataController.m
//  ThFrameworkPods
//
//  Created by syl on 16/4/19.
//  Copyright (c) 2016 Tihom-syl. All rights reserved.
//  在这里发起请求
//

#import "MMVMTestDataController.h"
#import "RACEXTKeyPathCoding.h"
#import "YTKBaseRequest.h"
#import "LoginApi.h"
#import "MMVMTestViewModel.h"
#import "MMVMTestModel.h"
#import "ThModel+Th.h"

@implementation MMVMTestDataController


- (void)loginUser:(NSString *)username password:(NSString *)password {
    NSString *strUser = username;
    NSString *strPass = password;
    if (strUser.length > 0 && strPass.length > 0) {
        LoginApi *api = [[LoginApi alloc] initWithLoginUser:username password:password];
        [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
            // 你可以直接在这里使用 self
            NSLog(@"succeed");
            NSLog(@"succeed:%@" ,request.responseString);
            self.mmvmTestModel = [self.mmvmTestModel ThInitWithRequest:request];
            if (self.mmvmTestModel  != nil) {
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"login" object:self.mmvmTestModel ];

            }

        }                                failure:^(YTKBaseRequest *request) {
            // 你可以直接在这里使用 self
            NSLog(@"failed");
        }];
    }
}




+ (MMVMTestDataController *)instance {
    static MMVMTestDataController *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mmvmTestModel = [[MMVMTestModel alloc] init];
    }

    return self;
}

@end
