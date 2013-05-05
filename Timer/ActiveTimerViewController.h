//
//  ActiveTimerViewController.h
//  Timer
//
//  Created by Natasha Murashev on 5/4/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Time.h"
#import "ViewController.h"

@interface ActiveTimerViewController : UIViewController

@property (nonatomic, retain) Time *time;
@property (nonatomic, retain) ViewController *viewController;

@end
