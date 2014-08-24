//
//  StatisticsViewController.h
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBPieChart.h"

@interface StatisticsViewController : UIViewController
{
    int numberOfTotalTweets;
    int numberOfCoolTweets;
    int numberOfBoringTweets;
    VBPieChart *pieChart;

}
//Defining properties
@property (nonatomic,retain) NSDictionary *chartValues;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UILabel *totalNewsDisplayedLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfTotalNewsDisplayed;
@property (weak, nonatomic) IBOutlet UILabel *coolLabel;
@property (weak, nonatomic) IBOutlet UILabel *boringLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfCoolTweetsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfBoringTweetsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coolTweetsColorIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *boringTweetsColorIndicator;

//Defining Actions
- (IBAction)closeButtonTapped:(id)sender;

-(void)drawPieChartForFeedbackwithTotalTweets:(int)totalTweets
                               withCoolTweets:(int)coolTweets
                             withBoringTweets:(int)boringTweets;

@end
