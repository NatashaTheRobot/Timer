//
//  ViewController.m
//  Timer
//
//  Created by Natasha Murashev on 5/3/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize display = _display;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)userDidPressNumber:(id)sender
{
    self.display.text = [NSString stringWithFormat:@"%@%@", self.display.text, [sender titleForState:UIControlStateNormal]];
}

- (void)clearDisplay
{
    self.display.text = @"";
}
@end
