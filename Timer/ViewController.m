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
    
    NSMutableArray *timeUnits;
    NSString *time;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterStartTime:(id)sender
{
    if (!timeUnits) {
        timeUnits = [[NSMutableArray alloc] init];
    }
    
    if ([timeUnits count] <= 6) {
        
        NSString *lastCharTyped = [textField.text substringFromIndex:[textField.text length] - 1];
        [timeUnits addObject:lastCharTyped];
        
        switch ([timeUnits count]) {
            case 1:
                time = [[NSString alloc] initWithFormat:@"00:00:0%@", timeUnits[0]];
                break;
            case 2:
                time = [[NSString alloc] initWithFormat:@"00:00:%@%@", timeUnits[0], timeUnits[1]];
                break;
            case 3:
                time = [[NSString alloc] initWithFormat:@"00:0%@:%@%@", timeUnits[0], timeUnits[1], timeUnits[2]];
                break;
            case 4:
                time = [[NSString alloc] initWithFormat:@"00:%@%@:%@%@", timeUnits[0], timeUnits[1], timeUnits[2], timeUnits[3]];
                break;
            case 5:
                time = [[NSString alloc] initWithFormat:@"0%@:%@%@:%@%@", timeUnits[0], timeUnits[1], timeUnits[2], timeUnits[3], timeUnits[4]];
                break;
            case 6:
                time = [[NSString alloc] initWithFormat:@"%@%@:%@%@:%@%@", timeUnits[0], timeUnits[1], timeUnits[2], timeUnits[3], timeUnits[4], timeUnits[5]];
                break;
        }
    }
    
    timeLabel.text = time;
}

- (IBAction)clearWithButton:(id)sender {
    [timeUnits removeAllObjects];
    time = @"00:00:00";
    timeLabel.text = time;
}
@end
