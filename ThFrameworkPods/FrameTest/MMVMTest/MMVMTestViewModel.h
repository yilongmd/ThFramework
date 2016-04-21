//
// Created by syl on 16/4/19.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IKit.h"
#import "MMVMTestModel.h"
#import "ThMacro.h"
#import "ThViewModel.h"


@interface MMVMTestViewModel : ThViewModel

//Model
@prop_strong(MMVMTestModel *,mmvmTestModel);

//View
@prop_strong(IView *,view);
@prop_strong(IButton *,submit);
@prop_strong(IInput *,inputUser);
@prop_strong(IInput *,inputPass)


@end