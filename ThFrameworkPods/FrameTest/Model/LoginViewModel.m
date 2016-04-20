//
// Created by syl on 16/4/15.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "LoginViewModel.h"
#import "ThModel.h"
#import "IInput.h"
#import "IButton.h"
#import "LoginModel.h"
#import "ThModel+Th.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import "ThJSON.h"


@implementation LoginViewModel {

}

- (void)getData {
//    [super getData];

//    ThRequest *request = [self getRequest];
//    [request getWithURLString:@"http://b2b.insoftb.com/UserInface/login" parameters:nil success:^(id o) {
//        if (o) {
//            _loginModel = [[LoginModel alloc] ThInitWithObject:o];
//        }
//    } failure:^(NSError *error) {
//
//    }];
//    [ThHttpRequest getWithURLString:@"http://b2b.insoftb.com/UserInface/login" parameters:nil success:^(id responseObject) {
//        DLog(@"%@",responseObject);
//        NSString *strJson = [ThJSON dictOrArrayToJSONString:responseObject];
//        JSONModelError *error1;
//        _loginModel = [_loginModel ThInitWithObject:responseObject];
//        NSLog(@"Error: %@", error1);
//    } failure:^(NSError *error) {
//
//    }];

//    @try {
//        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//
//        NSURL *URL = [NSURL URLWithString:@"http://b2b.insoftb.com/UserInface/login"];
//        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//
//        NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//            if (error) {
//                NSLog(@"Error: %@", error);
//            } else {
//                NSLog(@"%@ %@", response, responseObject);
//                NSString *strJson = [ThJSON dictOrArrayToJSONString:responseObject];
//                JSONModelError *error1;
//                _loginModel = [_loginModel ThInitWithObject:responseObject];
//                NSLog(@"Error: %@", error1);
//            }
//        }];
//        [dataTask resume];
//    }
//    @catch (NSException *exception) {
//
//    }
}

- (void)ViewBindWithModel {
    _loginModel = [[LoginModel alloc] init];
    [RACObserve(_loginModel, msg)
            subscribeNext:^(NSString * x){
                if (x != nil && x.length>0) {
                    self.inputUser.text = x;
                }

            }];
}


@end