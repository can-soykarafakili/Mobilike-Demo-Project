//
//  Util.m
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import "Util.h"

@implementation Util


//Declaring consumerKey and consumerSecret for Login and Search Methods

static NSString *consumerKey = @"G10mCUxpNXHGPogNHCNwleJaB";
static NSString *consumerSecret = @"ZcrWvfUj9J7x3NAWZVVGZASV9QAphub444S45VBqjus6zjP9A5";

//Searchkey is empty at the beginning
static NSString *searchKey = @"";

+(NSString *)consumerKey
{
    return consumerKey;
}

+(NSString *)consumerSecret
{
    return consumerSecret;
}

//Getter
+(NSString *)searchKey
{
    return searchKey;
}

//Setter
+(void)setSearchKey:(NSString*)search
{
    searchKey = search;
}

@end
