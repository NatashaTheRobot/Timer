//
//  ActiveTimerViewController.m
//  Timer
//
//  Created by Natasha Murashev on 5/4/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "ActiveTimerViewController.h"

@interface ActiveTimerViewController ()
{
    __weak IBOutlet UILabel *timeLabel;
    NSTimer *timer;
    int counter;
}
- (IBAction)cancelWithButton:(id)sender;
- (void)startTimerCountdown;
- (void)advancedTimer:(NSTimer *)countdownTimer;

@property (assign) int counter;

@end

@implementation ActiveTimerViewController

@synthesize time;
@synthesize counter;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    timeLabel.text = time.timeText;
    [self startTimerCountdown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelWithButton:(id)sender {
    [self.view removeFromSuperview];
}

- (void)startTimerCountdown
{
    counter = [time convertTimeTextToSeconds];
    NSTimer *countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                               target:self
                                                             selector:@selector(advancedTimer:)
                                                             userInfo:nil
                                                              repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:countdownTimer forMode:NSDefaultRunLoopMode];
}

- (void)advancedTimer:(NSTimer *)countdownTimer
{
    [self setCounter:(counter - 1)];
    timeLabel.text = [time convertSecondsToTimeText:counter];
    if (counter <= 0) {
        [countdownTimer invalidate];
    }
}

@end
