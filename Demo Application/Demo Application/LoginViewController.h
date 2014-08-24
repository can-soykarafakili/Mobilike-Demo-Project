//
//  LoginViewController.h
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STTwitter.h"
#import "Util.h"

@interface LoginViewController : UIViewController

//Defining properties
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginWithTwitterButton;

//Defining Actions
- (IBAction)loginWtihTwitter:(id)sender;

@end
