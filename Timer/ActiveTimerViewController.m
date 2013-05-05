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
}
- (IBAction)cancelWithButton:(id)sender;

@end

@implementation ActiveTimerViewController

@synthesize time;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelWithButton:(id)sender {
    [self.view removeFromSuperview];
}

@end
