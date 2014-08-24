//
//  DisplayResultsDetailViewController.m
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import "DisplayResultsDetailViewController.h"
#import "MoreRecommendationsViewController.h"
#import "SearchTopicViewController.h"
#import "StatisticsViewController.h"

@interface DisplayResultsDetailViewController ()

@end

@implementation DisplayResultsDetailViewController

@synthesize tweetDetailView,tweetDetailWebView,boringButton,coolButton,readyView,resultsArray;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) setTheLoadingIndicator
{
    //Creating the progress bar
    indicatorView = [[MONActivityIndicatorView alloc]init];
    
    //Settings some properties for the progress bar
    indicatorView.numberOfCircles = 5;
    indicatorView.radius = 10;
    indicatorView.internalSpacing = 3;
    indicatorView.duration = 0.5;
    indicatorView.delay = 0.5;
    indicatorView.center = self.view.center;
    [self.view addSubview:indicatorView];
    
    //Starting the progress bar
    [indicatorView startAnimating];
}

-(void)viewWillAppear:(BOOL)animated
{
    coolTweetsCount = 0;
    boringTweetsCount = 0;
    totalTweetsCount = 0;
    
    
    [self.readyView setHidden:NO];
    [self.tweetDetailWebView setHidden:YES];
    
    [self performSelector:@selector(showTweetDetailWebView) withObject:nil afterDelay:2];
    
    [self setTheLoadingIndicator];
}

-(void)showTweetDetailWebView
{
    [self.readyView setHidden:YES];
    [self.tweetDetailWebView setHidden:NO];
    [self loadTweetDetailURL];
}

-(void)loadTweetDetailURL
{
    if(totalTweetsCount > [resultsArray count]-1)
    {
        MoreRecommendationsViewController* moreRecommendationsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MoreRecommendationsViewController"];
        
        [self.navigationController pushViewController:moreRecommendationsViewController animated:YES];
    }
    else
    {
        
        //Starting the progress bar
        [indicatorView startAnimating];
        
        //For Presentation Purposes the webview is setHidden
        [self.tweetDetailWebView setHidden:YES];
        
        [self.tweetDetailWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[resultsArray objectAtIndex:totalTweetsCount]]]];
        
        //"Cool" and "Boring" buttons are enabled after the web page is loaded
        [self.coolButton setEnabled:NO];
        [self.boringButton setEnabled:NO];
    }
}


-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [indicatorView stopAnimating];
    
    [self.coolButton setEnabled:YES];
    [self.boringButton setEnabled:YES];
    
    [self.tweetDetailWebView setHidden:FALSE];
}

- (IBAction)boringButtonTapped:(id)sender
{
    boringTweetsCount++;
    totalTweetsCount++;
    [self loadTweetDetailURL];
}

- (IBAction)coolButtonTapped:(id)sender
{
    coolTweetsCount++;
    totalTweetsCount++;
    [self loadTweetDetailURL];
}

- (IBAction)searchButtonTapped:(id)sender
{
    SearchTopicViewController* searchTopicViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchTopicViewController"];
    [self.navigationController pushViewController:searchTopicViewController animated:YES];
}

- (IBAction)statisticsButtonTapped:(id)sender
{
    StatisticsViewController* statisticsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"StatisticsViewController"];
    [statisticsViewController drawPieChartForFeedbackwithTotalTweets:totalTweetsCount
                                                      withCoolTweets:coolTweetsCount
                                                    withBoringTweets:boringTweetsCount];
    [self.navigationController presentViewController:statisticsViewController animated:YES completion:NULL];
    
}
@end
