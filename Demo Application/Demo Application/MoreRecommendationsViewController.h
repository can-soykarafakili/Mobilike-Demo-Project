//
//  MoreRecommendationsViewController.h
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"

@interface MoreRecommendationsViewController : UIViewController

//Defining properties
@property (weak, nonatomic) IBOutlet UILabel *moreRecommendationsLabel;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@property (weak, nonatomic) IBOutlet UIButton *anotherTopicButton;

//Defining Actions
- (IBAction)yesButtonTapped:(id)sender;
- (IBAction)anotherTopicButtonTapped:(id)sender;

@end
