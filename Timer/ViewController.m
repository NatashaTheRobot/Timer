//
//  ViewController.m
//  Timer
//
//  Created by Natasha Murashev on 5/3/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UILabel *timeLabel;
    __weak IBOutlet UITextField *textField;
    
    NSString *time;
    
    int textFieldTextLength;
}
- (IBAction)enterStartTime:(id)sender;
- (IBAction)clearWithButton:(id)sender;

- (NSString *)newTime;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [textField becomeFirstResponder];
    textFieldTextLength = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterStartTime:(id)sender
{
    if ([textField.text length] > textFieldTextLength) {
        textFieldTextLength++;
    
        if ([textField.text length] <= 6) {
            time = [self newTime];
        }
    } else {
        textFieldTextLength--;
        
        if (textFieldTextLength > 0) {
            time = [self newTime];
        } else {
            time = @"00:00:00";
        }
    }
    
    timeLabel.text = time;
}

- (IBAction)clearWithButton:(id)sender {
    time = @"00:00:00";
    textField.text = @"";
    textFieldTextLength = 0;
    timeLabel.text = time;
}

- (NSString *)newTime
{
    switch ([textField.text length]) {
        case 1:
            time = [[NSString alloc] initWithFormat:@"00:00:0%c", [textField.text characterAtIndex:0]];
            break;
        case 2:
            time = [[NSString alloc] initWithFormat:@"00:00:%c%c", [textField.text characterAtIndex:0], [textField.text characterAtIndex:1]];
            break;
        case 3:
            time = [[NSString alloc] initWithFormat:@"00:0%c:%c%c", [textField.text characterAtIndex:0], [textField.text characterAtIndex:1], [textField.text characterAtIndex:2]];
            break;
        case 4:
            time = [[NSString alloc] initWithFormat:@"00:%c%c:%c%c", [textField.text characterAtIndex:0], [textField.text characterAtIndex:1], [textField.text characterAtIndex:2], [textField.text characterAtIndex:3]];
            break;
        case 5:
            time = [[NSString alloc] initWithFormat:@"0%c:%c%c:%c%c", [textField.text characterAtIndex:0], [textField.text characterAtIndex:1], [textField.text characterAtIndex:2], [textField.text characterAtIndex:3], [textField.text characterAtIndex:4]];
            break;
        case 6:
            time = [[NSString alloc] initWithFormat:@"%c%c:%c%c:%c%c", [textField.text characterAtIndex:0], [textField.text characterAtIndex:1], [textField.text characterAtIndex:2], [textField.text characterAtIndex:3], [textField.text characterAtIndex:4], [textField.text characterAtIndex:5]];
            break;
    }
    return time;
}
@end
