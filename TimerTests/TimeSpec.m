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
    
    context(@"formatIncorrectTime", ^{
        it(@"moves the seconds to minutes for time text 00:05:68", ^{
            time.timeText = @"00:05:68";
            [time formatIncorrectTime];
            [[time.timeText should] equal:@"00:06:08"];
        });
        it(@"moves the minutes to hours for time text 01:96:08", ^{
            time.timeText = @"01:96:08";
            [time formatIncorrectTime];
            [[time.timeText should] equal:@"02:36:08"];
        });
        it(@"moves the seconds and minutes to hours for time text 06:98:98", ^{
            time.timeText = @"06:98:98";
            [time formatIncorrectTime];
            [[time.timeText should] equal:@"07:39:38"];
        });
        it(@"moves the seconds and minutes to hours for time text 60:60:60", ^{
            time.timeText = @"60:60:60";
            [time formatIncorrectTime];
            [[time.timeText should] equal:@"61:01:00"];
        });
        it(@"moves the seconds and minutes to hours for time text 99:99:99", ^{
            time.timeText = @"99:99:99";
            [time formatIncorrectTime];
            [[time.timeText should] equal:@"100:40:39"];
        });
        it(@"returns the same time as the original when the time is entered correctly", ^{
            time.timeText = @"06:07:59";
            [time formatIncorrectTime];
            [[time.timeText should] equal:@"06:07:59"];
        });
    });
});

SPEC_END
