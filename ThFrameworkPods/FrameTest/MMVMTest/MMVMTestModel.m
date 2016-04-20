//
//  MMVMTestModel.m
//  ThFrameworkPods
//
//  Created by syl on 16/4/19.
//  Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "MMVMTestModel.h"

@implementation MMVMTestModel


//如果是JSONModal注入,可以允许有多余的字段
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end
