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

@end
