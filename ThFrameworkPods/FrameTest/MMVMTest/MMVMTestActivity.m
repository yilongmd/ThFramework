//
//  MMVMTestActivity.m
//  ThFrameworkPods
//
//  Created by syl on 16/4/19.
//  Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "MMVMTestActivity.h"
#import "IKit.h"
#import "YTKNetworkConfig.h"
#import "MMVMTestDataController.h"
#import "MMVMTestModel.h"
#import "MMVMTestViewModel.h"
#import "MMVMTestModel.h"

@implementation MMVMTestActivity


- (void)onCreate {
    [super onCreate];
    YTKNetworkConfig *config = [YTKNetworkConfig sharedInstance];
    config.baseUrl = @"http://b2b.insoftb.com";
//    config.cdnUrl = @"http://fen.bi";
    self.navigationItem.title = @"MMVMTestActivity";
    IView *view = [IView namedView:@"mmvmtest"];
    [self addIViewRow:view];
    [self reload];

    _mmvmTestViewModel = [[MMVMTestViewModel alloc] init];
    IButton *submit = (IButton *)[view getViewById:@"submit"];
    IInput *inputUser = (IInput *) [view getViewById:@"name"];
    IInput *inputPass = (IInput *) [view getViewById:@"password"];

    _mmvmTestViewModel.submit = submit;
    _mmvmTestViewModel.inputUser = inputUser;
    _mmvmTestViewModel.inputPass = inputPass;
    _mmvmTestViewModel.view = self.view;

    [_mmvmTestViewModel viewWithData];

}

@end
