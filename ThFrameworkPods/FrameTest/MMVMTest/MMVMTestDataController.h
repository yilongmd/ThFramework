//
//  MMVMTestDataController.h
//  ThFrameworkPods
//
//  Created by syl on 16/4/19.
//  Copyright (c) 2016 Tihom-syl. All rights reserved.
//



#import <objc/NSObject.h>

@class MMVMTestModel;

@interface MMVMTestDataController : NSObject
{

}
+ (MMVMTestDataController *)instance;


@property(nonatomic, strong) MMVMTestModel *mmvmTestModel;


- (void)loginUser:(NSString *)username password:(NSString *)password;


@end
