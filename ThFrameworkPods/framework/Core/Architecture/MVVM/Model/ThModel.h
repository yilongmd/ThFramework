//
// Created by syl on 16/4/14.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "ThMacro.h"


//Model用户存放下载的数据,和原始初始化的数据
//应拥有一键缓存
@interface ThModel : JSONModel
{

}

//接收到的Json,或者其他类型字符串
@prop_strong(NSString<Ignore>* , strData);

@prop_strong(id<Ignore>  , data);

@prop_strong(NSDictionary<Ignore> *  , dicdata);

@prop_strong(NSNumber<Ignore>  * , intChanged);
@end