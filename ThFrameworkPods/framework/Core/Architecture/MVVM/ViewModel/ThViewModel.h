//
// Created by syl on 16/4/14.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThMacro.h"
#import "ReactiveCocoa.h"

@class ThRequest;

//ViewModal 拥有网络访问能力,和处理逻辑的能力,JSON注入能力
//多次声明
@interface ThViewModel : NSObject {

}

///////////
//View
//////////



///////////
//Model
//////////


//获取请求,ViewModel中可能有多个请求
- (ThRequest *)getRequest;

//把View绑定上Model
- (void)ViewBindWithModel;

//把Model绑定上View
- (void)ModelBindWithView;

- (void)getData;
@end