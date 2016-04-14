//
// Created by syl on 16/4/14.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Studio;


@interface Person : NSObject {
    NSString *_pName;
    Studio *_studio;
}

@property (nonatomic,strong)NSString *pName;
@property (nonatomic,strong)Studio *studio;



@end