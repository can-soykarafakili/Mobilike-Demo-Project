//
//  DisplayResultsDetailViewController.h
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MONActivityIndicatorView.h"

@interface DisplayResultsDetailViewController : UIViewController <UIWebViewDelegate>

{
    int coolTweetsCount;
    int boringTweetsCount;
    int totalTweetsCount;
    
    MONActivityIndicatorView *indicatorView;
}
//Defining properties
@property (weak, nonatomic) IBOutlet UIWebView *tweetDetailWebView;
@property (weak, nonatomic) IBOutlet UIButton *boringButton;
@property (weak, nonatomic) IBOutlet UIButton *coolButton;
@property (weak, nonatomic) IBOutlet UIView *tweetDetailView;
@property (weak, nonatomic) IBOutlet UIView *readyView;
@property (strong, nonatomic) NSArray *resultsArray;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *statisticsButton;

//Defining Actions
- (IBAction)boringButtonTapped:(id)sender;
- (IBAction)coolButtonTapped:(id)sender;
- (IBAction)searchButtonTapped:(id)sender;
- (IBAction)statisticsButtonTapped:(id)sender;

@end
