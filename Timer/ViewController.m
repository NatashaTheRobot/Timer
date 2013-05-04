//
//  ViewController.m
//  Timer
//
//  Created by Natasha Murashev on 5/3/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "ViewController.h"
#import "Time.h"

@interface ViewController ()
{
    __weak IBOutlet UILabel *timeLabel;
    __weak IBOutlet UITextField *textField;
    
    Time *time;
    
    int textFieldTextLength;
}
- (IBAction)enterStartTime:(id)sender;
- (IBAction)clearWithButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [textField becomeFirstResponder];
    textFieldTextLength = 0;
    time = [[Time alloc] init];
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
            [time newTime:textField.text];
        }
    } else {
        textFieldTextLength--;
        
        if (textFieldTextLength > 0) {
            [time newTime:textField.text];
        } else {
            time.timeText = @"00:00:00";
        }
    }
    
    timeLabel.text = time.timeText;
}

- (IBAction)clearWithButton:(id)sender {
    time.timeText = @"00:00:00";
    textField.text = @"";
    textFieldTextLength = 0;
    timeLabel.text = time.timeText;
}
@end
