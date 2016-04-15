//
// Created by syl on 16/4/15.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThViewModel.h"
#import "IKit.h"
#import "ReactiveCocoa.h"


@class ThModel;
@class IInput;
@class IButton;
@class LoginModel;


@interface LoginViewModel : ThViewModel

//Model
@prop_strong(LoginModel *,loginModel);

//View
@prop_strong(IView *,view);
@prop_strong(IButton *,submit);
@prop_strong(IInput *,inputUser);
@prop_strong(IInput *,inputPass);

@end