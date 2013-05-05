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
    
    int counter;
    NSTimer *countdownTimer;
    NSDate *pauseStart, *previousFireDate;
}
- (IBAction)cancelWithButton:(id)sender;
- (IBAction)pauseOrRestartWithButton:(id)sender;


- (void)startTimerCountdown;
- (void)advanceTimer:(NSTimer *)countdownTimer;
- (void)pauseTimer;
- (void)restartTimer;

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

- (IBAction)cancelWithButton:(id)sender
{
    [self.view removeFromSuperview];
}

- (IBAction)pauseOrRestartWithButton:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSString *buttonTitle = button.currentTitle;
    if ([buttonTitle isEqualToString:@"||"]) {
        [button setTitle:@">" forState:UIControlStateNormal];
        // pause timer
        [self pauseTimer];
    } else {
        [button setTitle:@"||" forState:UIControlStateNormal];
        // restart timer
        [self restartTimer];
    }
}

- (void)startTimerCountdown
{
    counter = [time convertTimeTextToSeconds];
    countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                               target:self
                                                             selector:@selector(advanceTimer:)
                                                             userInfo:nil
                                                              repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:countdownTimer forMode:NSDefaultRunLoopMode];
}

- (void)advanceTimer:(NSTimer *)timer
{
    [self setCounter:(counter - 1)];
    timeLabel.text = [time convertSecondsToTimeText:counter];
    if (counter <= 0) {
        [timer invalidate];
    }
}

- (void)pauseTimer
{
    pauseStart = [NSDate dateWithTimeIntervalSinceNow:0];
    
    previousFireDate = [countdownTimer fireDate];
    
    [countdownTimer setFireDate:[NSDate distantFuture]];
}

- (void)restartTimer
{
    
}

@end
