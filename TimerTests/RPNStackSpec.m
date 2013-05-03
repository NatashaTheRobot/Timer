//
//  RPNStackSpec.m
//  Timer
//
//  Created by Natasha Murashev on 5/3/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "Kiwi.h"
#import "RPNStack.h"

SPEC_BEGIN(RPNStackSpec)

describe(@"The stack", ^{
    
    RPNStack *stack = [[RPNStack alloc] init];
    
    afterEach(^{
        [stack clear];
    });
    
   
    context(@"when created", ^{
//        __block RPNStack *stack;
//        beforeEach(^{
//            stack = [[RPNStack alloc] init];
//        });
        
        it(@"is not nil.", ^{
            [stack shouldNotBeNil];
        });
        
        it(@"is empty", ^{
            [[stack should] beEmpty];
        });
        
        it(@"returns 0 for top", ^{
            [[theValue([stack top]) should] beZero];
        });
        
        it(@"throws an exception when I pop an empty stack", ^{
            [[theBlock(^{
                [stack pop];
            }) should] raiseWithName:@"RPNEmptyStackPopException"];
        });
        
    });
    
    context(@"after pushing 4.7 on an empty stack", ^{
        beforeEach(^{
            [stack push:4.7];
        });
       
        it(@"has exactly one element.", ^{
            [[stack should] haveCountOf:1];
        });
        
        it(@"has 4.7 on top.", ^{
            [[theValue([stack top]) should] equal:4.7
                                        withDelta:.001];
        });
        
        it(@"returns 4.7 from pop and then is empty", ^{
            [[theValue([stack pop]) should] equal:4.7
                                        withDelta:.001];
        });
        
    });
});

SPEC_END
