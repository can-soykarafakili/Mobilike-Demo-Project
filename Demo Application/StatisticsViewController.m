//
//  StatisticsViewController.m
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import "StatisticsViewController.h"

@interface StatisticsViewController ()

@end

@implementation StatisticsViewController

@synthesize closeButton,chartValues,numberOfTotalNewsDisplayed,totalNewsDisplayedLabel,coolLabel,coolTweetsColorIndicator,boringLabel,boringTweetsColorIndicator,numberOfBoringTweetsLabel,numberOfCoolTweetsLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)setThePieChart
{
    [pieChart setFrame:CGRectMake(80, 200, 160, 160)];
    [pieChart setEnableStrokeColor:YES];
    [pieChart setHoleRadiusPrecent:0.3];
    
    [pieChart.layer setShadowOffset:CGSizeMake(2, 2)];
    [pieChart.layer setShadowRadius:3];
    [pieChart.layer setShadowColor:[UIColor blackColor].CGColor];
    [pieChart.layer setShadowOpacity:0.7];
    
    
    self.chartValues = @{
                         @"first": @{@"value":[NSNumber numberWithInt:numberOfCoolTweets], @"color":[UIColor colorWithRed:54.0/255.0 green:199.0/255.0 blue:19.0/255.0 alpha:1.0]},
                         
                         @"second": @{@"value":[NSNumber numberWithInt:numberOfBoringTweets], @"color":[UIColor colorWithRed:186.0/255.0 green:9.0/255.0 blue:0.0/255.0 alpha:1.0]}
                         };
}

-(void)drawThePieChart
{
    [pieChart setChartValues:self.chartValues animation:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.numberOfTotalNewsDisplayed.text = [NSString stringWithFormat:@"%d",numberOfTotalTweets];
    self.numberOfCoolTweetsLabel.text = [NSString stringWithFormat:@"%d",numberOfCoolTweets];
    self.numberOfBoringTweetsLabel.text = [NSString stringWithFormat:@"%d",numberOfBoringTweets];

    if (!pieChart) {
        pieChart = [[VBPieChart alloc] init];
        [self.view addSubview:pieChart];
    }
    
    [self setThePieChart];
    
    [self drawThePieChart];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)closeButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


//Get the values in order to draw the piechart
-(void)drawPieChartForFeedbackwithTotalTweets:(int)totalTweets withCoolTweets:(int)coolTweets withBoringTweets:(int)boringTweets
{
    numberOfTotalTweets = totalTweets;
    numberOfCoolTweets = coolTweets;
    numberOfBoringTweets = boringTweets;
}

@end
