//
// Created by syl on 16/4/19.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "MMVMTestViewModel.h"
#import "MMVMTestModel.h"
#import "NSObject+RACPropertySubscribing.h"
#import "RACSignal+Operations.h"
#import "MBProgressHUD.h"
#import "UIView+Toast.h"
#import "UIControl+RACSignalSupport.h"
#import "MMVMTestDataController.h"
#import "NSNotificationCenter+RACSupport.h"

@implementation MMVMTestViewModel {

}

-(void) viewWithData {

    [RACObserve([MMVMTestDataController instance].mmvmTestModel, intChanged)
            subscribeNext:^(NSNumber * x){
                if (x.intValue>0) {
                    [self.view makeToast:[MMVMTestDataController instance].mmvmTestModel.msg];
                }

            }];
    [[self.submit.button rac_signalForControlEvents:UIControlEventTouchUpInside]
            subscribeNext:^(id x) {
                //可以通过静态的API来发送请求,+(void)的模式
                [[MMVMTestDataController instance] loginUser:self.inputUser.text password:self.inputPass.text];
            }];

    //通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"login" object:nil] subscribeNext:^(NSNotification *notification) {
        ALog(@"%@",notification.object);
    }];
}
@end