//
//  TimeSpec.m
//  Timer
//
//  Created by Natasha Murashev on 5/4/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "Kiwi.h"
#import "Time.h"

SPEC_BEGIN(MathSpec)

describe(@"Time", ^{
    
    Time *time = [[Time alloc] init];
    time.timeText = @"12:34:56";
    
    context(@"convertTimeTextToSeconds", ^{
        it(@"returns the correct time in seconds", ^{
            [[theValue([time convertTimeTextToSeconds]) should] equal:theValue(45296)];
        });
        it(@"returns 0 when time text is 00:00:00", ^{
           time.timeText = @"00:00:00";
           [[theValue([time convertTimeTextToSeconds]) should] equal:theValue(0)];
        });
    });
    
    context(@"converSecondsToTimeText", ^{
        it(@"returns the correct time text from 45296 seconds", ^{
            [[[time convertSecondsToTimeText:45296] should] equal:@"12:34:56"];
        });
        it(@"returns the correct time text from 3723 seconds", ^{
            [[[time convertSecondsToTimeText:3723] should] equal:@"01:02:03"];
        });
        it(@"returns the correct time text from 70 seconds", ^{
            [[[time convertSecondsToTimeText:70] should] equal:@"00:01:10"];
        });
        it(@"returns the correct time text from 0 seconds", ^{
            [[[time convertSecondsToTimeText:0] should] equal:@"00:00:00"];
        });
    });
});

SPEC_END
