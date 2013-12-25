//
//  FirstServiceSpec.m
//  DemoJenkins
//
//  Created by QuangPC on 12/25/13.
//  Copyright (c) 2013 quangpc. All rights reserved.
//

#import "Kiwi.h"
#import "FirstService.h"

SPEC_BEGIN(FirstServiceSpec)

describe(@"test_FirstService", ^{
	context(@"I want to test something", ^{
        __block FirstService *sut;
        
        beforeEach(^{
            sut = [[FirstService alloc] init];
        });
        
        it(@"test number bigger than 10", ^{
            NSNumber *inputNumber = @20;
            BOOL val = [sut isBiggerNumberThan10:inputNumber];
            [[theValue(val) should] equal:theValue(YES)];
        });
    });
});

SPEC_END