//
//  Time.h
//  Timer
//
//  Created by Natasha Murashev on 5/4/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Time : NSObject

@property (nonatomic, strong) NSString *timeText;

- (NSString *)newTime:(NSString *)textFieldText;
- (NSInteger)convertTimeTextToSeconds;
- (NSString *)convertSecondsToTimeText:(NSInteger)seconds;

@end
