//
// Created by syl on 16/4/14.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "Person.h"
#import "Studio.h"


@implementation Person

@synthesize pName = _pName;
@synthesize studio = _studio;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.studio = [[Studio alloc] init];
    }

    return self;
}

-(NSString *) getpName {
    return @"XXXX";
}






@end