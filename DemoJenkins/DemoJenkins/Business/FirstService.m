//
//  FirstService.m
//  DemoJenkins
//
//  Created by QuangPC on 12/25/13.
//  Copyright (c) 2013 quangpc. All rights reserved.
//

#import "FirstService.h"

@implementation FirstService

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (BOOL)isBiggerNumberThan10:(NSNumber *)number; {
    double value = [number doubleValue];
    if (value > 10) {
        return YES;
    }
    return NO;
}

@end
