//
//  RPNEntrySpec.m
//  Timer
//
//  Created by Natasha Murashev on 5/3/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "Kiwi.h"
#import "ViewController.h"

SPEC_BEGIN(RPNEntrySpec)

UIButton * (^buttonWithTitle)(NSString *name) = ^UIButton *(NSString *name){
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:name forState:UIControlStateNormal];
    return button;
};

ViewController * (^calculatorVC)(void) = ^ViewController *(void){
    ViewController *tempVC = [[ViewController alloc] init];
    UILabel *label = [[UILabel alloc] init];
    [tempVC.view addSubview:label];
    tempVC.display = label;
    return tempVC;
};

describe(@"Calcluator View Controller", ^{
    ViewController *calVC = calculatorVC();
    UIButton *numberThreeButton = buttonWithTitle(@"3");
    UIButton *numberFiveButton = buttonWithTitle(@"5");
    
    beforeEach(^{
        [calVC clearDisplay];
    });
    
    context(@"when the display is blank", ^{
        it(@"displays 3 after the 3 button is pressed", ^{
            [calVC userDidPressNumber:numberThreeButton];
            [[calVC.display shouldNot] beNil];
            [[calVC.display.text should] equal:@"3"];
        });
        
        it(@"displays 35 after the 3 and 5 buttons are pressed", ^{
            [calVC userDidPressNumber:numberThreeButton];
            [calVC userDidPressNumber:numberFiveButton];
            [[calVC.display.text should] equal:@"35"];
        });
    });
});

SPEC_END
