//
// Created by syl on 16/4/15.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "ThJSON.h"
#import "ThMacro.h"


@implementation ThJSON {

}

+ (NSString *)dictOrArrayToJSONString:(id)dictionaryOrArray {
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionaryOrArray options:NSJSONWritingPrettyPrinted error:nil];
    if (data == nil) {
        return nil;
    }
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (nilToEmpty(string)) {
        return string;
    } else {
        return @"";
    }
}
@end