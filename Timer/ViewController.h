//
//  ViewController.h
//  Timer
//
//  Created by Natasha Murashev on 5/3/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Time.h"

@interface ViewController : UIViewController
{
    IBOutlet UITextField *textField;
}

@property (nonatomic, retain) Time *time;
@property (nonatomic, retain) IBOutlet UITextField *textField;

@end
