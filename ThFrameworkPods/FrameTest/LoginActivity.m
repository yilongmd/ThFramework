//
//  LoginActivity.m
//  ThFrameworkPods
//
//  Created by syl on 16/4/14.
//  Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "LoginActivity.h"
#import "IKit.h"
#import "NSObject+RACSelectorSignal.h"
#import "ReactiveCocoa.h"

@implementation LoginActivity


- (void)onCreate {
    [super onCreate];
    self.navigationItem.title = @"Login";

    IView *view = [IView namedView:@"login"];
    [self addIViewRow:view];
    [self reload];

    IButton *submit = (IButton *)[view getViewById:@"submit"];
    IInput *inputUser = (IInput *) [view getViewById:@"name"];
    IInput *inputPass = (IInput *) [view getViewById:@"password"];
    [[submit.button
            rac_signalForControlEvents:UIControlEventTouchUpInside]
            subscribeNext:^(id x) {
                NSLog(@"button clicked");
            }];

//    [inputUser.textField.rac_textSignal subscribeNext:^(id x){
//        NSLog(@"change:%@", x);
//    }];

    //大于三行在触发
//    [[inputUser.textField.rac_textSignal
//            filter:^BOOL(id value){
//                NSString*text = value;
//                return text.length > 3;
//            }]
//            subscribeNext:^(id x){
//                NSLog(@"%@", x);
//            }];

    //先把信号保存起来要用的时候在使用
//    RACSignal *usernameSourceSignal =
//            inputUser.textField.rac_textSignal;
//
//    RACSignal *filteredUsername =[usernameSourceSignal
//            filter:^BOOL(id value){
//                NSString*text = value;
//                return text.length > 3;
//            }];
//
//    [filteredUsername subscribeNext:^(id x){
//        NSLog(@"%@", x);
//    }];



//    [[[inputUser.textField.rac_textSignal
//            map:^id(NSString*text){
//                return @(text.length);
//            }]
//            filter:^BOOL(NSNumber*length){
//                return[length integerValue] > 3;
//            }]
//            subscribeNext:^(id x){
//                NSLog(@"%@", x);
//            }];


}

- (NSNumber *)isValidUsername:(NSString *) text {
    return [[NSNumber alloc] initWithBool:YES];
}

- (NSNumber *) isValidPassword:(NSString *) text {
    return [[NSNumber alloc] initWithBool:YES];
}
@end
