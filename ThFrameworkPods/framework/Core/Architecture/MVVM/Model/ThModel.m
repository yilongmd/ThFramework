//
// Created by syl on 16/4/14.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "ThModel.h"


@implementation ThModel {

}

//如果是JSONModal注入,可以允许有多余的字段
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.intChanged = [[NSNumber alloc] initWithInt:0];
    }

    return self;
}


@end