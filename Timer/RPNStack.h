//
//  RPNStack.h
//  Timer
//
//  Created by Natasha Murashev on 5/3/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPNStack : NSObject

- (void)push:(double)numberToPush;
- (double)top;
- (void)clear;
- (double)pop;

@end
