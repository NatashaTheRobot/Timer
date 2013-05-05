//
//  Time.m
//  Timer
//
//  Created by Natasha Murashev on 5/4/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "Time.h"

@implementation Time

@synthesize timeText;

- (id)init
{
    self = [super init];
    if (self) {
        timeText = @"00:00:00";
    }
    return self;
}

- (NSString *)newTime:(NSString *)textFieldText
{
    switch ([textFieldText length]) {
        case 1:
            timeText = [[NSString alloc] initWithFormat:@"00:00:0%c", [textFieldText characterAtIndex:0]];
            break;
        case 2:
            timeText = [[NSString alloc] initWithFormat:@"00:00:%c%c", [textFieldText characterAtIndex:0], [textFieldText characterAtIndex:1]];
            break;
        case 3:
            timeText = [[NSString alloc] initWithFormat:@"00:0%c:%c%c", [textFieldText characterAtIndex:0], [textFieldText characterAtIndex:1], [textFieldText characterAtIndex:2]];
            break;
        case 4:
            timeText = [[NSString alloc] initWithFormat:@"00:%c%c:%c%c", [textFieldText characterAtIndex:0], [textFieldText characterAtIndex:1], [textFieldText characterAtIndex:2], [textFieldText characterAtIndex:3]];
            break;
        case 5:
            timeText = [[NSString alloc] initWithFormat:@"0%c:%c%c:%c%c", [textFieldText characterAtIndex:0], [textFieldText characterAtIndex:1], [textFieldText characterAtIndex:2], [textFieldText characterAtIndex:3], [textFieldText characterAtIndex:4]];
            break;
        case 6:
            timeText = [[NSString alloc] initWithFormat:@"%c%c:%c%c:%c%c", [textFieldText characterAtIndex:0], [textFieldText characterAtIndex:1], [textFieldText characterAtIndex:2], [textFieldText characterAtIndex:3], [textFieldText characterAtIndex:4], [textFieldText characterAtIndex:5]];
            break;
    }
    return timeText;
}

- (void)formatIncorrectTime
{
    NSString *correctTimeText;
    
    // seconds
    NSString *secondsText = [timeText substringWithRange:NSMakeRange(6, 2)];
    int seconds = [secondsText intValue];
    int remainingSeconds = -1;
    
    if (seconds > 59) {
        remainingSeconds = seconds - 60;
        if (remainingSeconds > 9) {
            correctTimeText = [[NSString alloc] initWithFormat:@":%i", remainingSeconds];
        } else {
            correctTimeText = [[NSString alloc] initWithFormat:@":0%i", remainingSeconds];
        }
    } else {
        correctTimeText = [[NSString alloc] initWithFormat:@":%@", secondsText];
    }
    
    // minutes
    NSString *minutesText = [timeText substringWithRange:NSMakeRange(3, 2)];
    int minutes = [minutesText intValue];
    int remainingMinutes = -1;
    NSString *newMinutesText;
    
    if (remainingSeconds >= 0) {
        minutes += 1;
    }
    
    if (minutes > 59) {
        remainingMinutes = minutes - 60;
        if (remainingMinutes > 9) {
            newMinutesText = [[NSString alloc] initWithFormat:@":%i", remainingMinutes];
        } else {
            newMinutesText = [[NSString alloc] initWithFormat:@":0%i", remainingMinutes];
        }
    } else {
        if (minutes > 9) {
            newMinutesText = [[NSString alloc] initWithFormat:@":%i", minutes];
        } else {
            newMinutesText = [[NSString alloc] initWithFormat:@":0%i", minutes];
        }
        
    }
    
    correctTimeText = [newMinutesText stringByAppendingString:correctTimeText];
    
    // hours
    
    NSString *hoursText = [timeText substringWithRange:NSMakeRange(0, 2)];
    int hours = [hoursText intValue];
    NSString *newHoursText;
    
    if (remainingMinutes >= 0) {
        hours += 1;
    }
    
    if (hours > 9) {
        newHoursText = [[NSString alloc] initWithFormat:@"%i", hours];
    } else {
        newHoursText = [[NSString alloc] initWithFormat:@"0%i", hours];
    }
    
    correctTimeText = [newHoursText stringByAppendingString:correctTimeText];
    
    timeText = correctTimeText;
}

- (NSInteger)convertTimeTextToSeconds
{
    NSInteger seconds = 0;
    
    // seconds
    NSString *secondsText = [timeText substringWithRange:NSMakeRange(6, 2)];
    seconds += [secondsText intValue];
    
    // minutes
    NSString *minutesText = [timeText substringWithRange:NSMakeRange(3, 2)];
    seconds += [minutesText intValue] * 60;
    
    // hours
    NSString *hoursText = [timeText substringWithRange:NSMakeRange(0,2)];
    seconds += [hoursText intValue] * 60 * 60;
    
    return seconds;
}

- (NSString *)convertSecondsToTimeText:(NSInteger)seconds
{
    // hours
    int hours = seconds / (60 * 60);
    
    if (hours > 9) {
        timeText = [[NSString alloc] initWithFormat:@"%i:", hours];
    } else {
        timeText = [[NSString alloc] initWithFormat:@"0%i:", hours];
    }
    
    // minutes
    int minutes = (seconds - (hours * 60 * 60)) / 60;
    
    if (minutes > 9) {
        timeText = [timeText stringByAppendingFormat:@"%i:", minutes];
    } else {
        timeText = [timeText stringByAppendingFormat:@"0%i:", minutes];
    }
    
    //seconds
    int remainingSeconds = seconds - (hours * 60 * 60) - (minutes * 60);
    
    if (remainingSeconds > 9) {
        timeText = [timeText stringByAppendingFormat:@"%i", remainingSeconds];
    } else {
        timeText = [timeText stringByAppendingFormat:@"0%i", remainingSeconds];
    }
    
    return timeText;
}

@end
