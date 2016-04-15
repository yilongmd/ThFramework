//
// Created by syl on 16/4/15.
// Copyright (c) 2016 Tihom-syl. All rights reserved.
//

#import "NSString+UrlToKey.h"
#import "SSToolkit.h"


@implementation NSString (UrlToKey)

-(NSString *) UrlToKey
{
    NSString *strKey = self;
    if (strKey != nil && strKey.length>0) {
        strKey = [strKey sam_MD5Digest];
        strKey = [NSString stringWithFormat:@"%@%@",strKey,@"th"];
        strKey = [strKey sam_MD5Digest];
        return strKey;
    }
    else {
        return self;
    }
}
@end