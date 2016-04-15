//
// Created by syl on 16/4/15.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "ThModel.h"


@interface LoginModel : ThModel

//{"result":"error","time":"2016-04-15 16:14:55","status":"99","item":[],"sum":0,"msg":"系统异常:请联系授权公司"}

@property(nonatomic, assign) NSString * result;
@property(nonatomic, assign) NSString * time;
@property(nonatomic, assign) NSString * status;
@property(nonatomic, assign) NSString *  sum;
@property(nonatomic, assign) NSString *  msg;
@property(nonatomic, assign) NSObject *  item;


@end