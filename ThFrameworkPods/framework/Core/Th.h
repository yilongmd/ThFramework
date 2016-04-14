//
// Created by syl on 16/4/14.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import <Foundation/Foundation.h>

// ----------------------------------
// Mac/iOS include headers
// ----------------------------------

#ifdef __OBJC__

#import <Availability.h>
#import <Foundation/Foundation.h>

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import <UIKit/UIKit.h>


#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)



#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)


#endif	// #ifdef __OBJC__

@interface Th : NSObject
@end