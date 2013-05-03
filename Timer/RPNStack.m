//
//  RPNStack.m
//  Timer
//
//  Created by Natasha Murashev on 5/3/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "RPNStack.h"

@interface RPNStack()

@property (nonatomic, retain) NSMutableArray *data;

@end

@implementation RPNStack

@synthesize data = _data;

- (id)init
{
    self = [super init];
    if (self) {
        _data = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)push:(double)numberToPush
{
    [self.data addObject:[NSNumber numberWithDouble:numberToPush]];
}

- (double)top
{
    return [[self.data lastObject] doubleValue];
}

- (NSUInteger)count
{
    return [self.data count];
}

- (void)clear
{
    [self.data removeAllObjects];
}

- (double)pop
{
    double poppedValue = [self top];
    if (![self.data lastObject]) {
        [NSException raise:@"RPNEmptyStackPopException"
                    format:@"Pop was sent to an empty stack"];
    }
    
    [self.data removeLastObject];
    return poppedValue;
}

@end
