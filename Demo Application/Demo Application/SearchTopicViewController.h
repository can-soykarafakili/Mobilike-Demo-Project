//
//  SearchTopicViewController.h
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTopicViewController : UIViewController <UITextFieldDelegate>

//Defining properties
@property (weak, nonatomic) IBOutlet UILabel *informationLabel;
@property (weak, nonatomic) IBOutlet UIButton *readTweetButton;
@property (weak, nonatomic) IBOutlet UITextField *topicTextField;

//Defining Actions
- (IBAction)findTweetsWithTheTopic:(id)sender;
@end
