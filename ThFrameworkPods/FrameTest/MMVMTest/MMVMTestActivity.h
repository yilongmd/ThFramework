//
//  MMVMTestActivity.h
//  ThFrameworkPods
//
//  Created by syl on 16/4/19.
//  Copyright (c) 2016 Tihom-syl. All rights reserved.
//



#import "ThActivity.h"

@class MMVMTestDataController;
@class MMVMTestModel;
@class MMVMTestViewModel;

@interface MMVMTestActivity : ThActivity {
    MMVMTestViewModel *_mmvmTestViewModel;
}

//@prop_strong(MMVMTestDataController *,mmvmTestDataController);
@end
