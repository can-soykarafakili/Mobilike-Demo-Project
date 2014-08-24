//
//  LoadingViewController.m
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import "LoadingViewController.h"
#import "STTwitter.h"
#import "DisplayResultsDetailViewController.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

@synthesize searchQuerry;

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
    
    [self setTheLoadingIndicator];
    
    STTwitterAPI *twitter = [STTwitterAPI twitterAPIAppOnlyWithConsumerName:nil
                                                                consumerKey:[Util consumerKey]
                                                             consumerSecret:[Util consumerSecret]];
    
    [twitter verifyCredentialsWithSuccessBlock:^(NSString *username)
    {
        
        //Get 100 recent tweets
        
        [ twitter getSearchTweetsWithQuery:self.searchQuerry
                                   geocode:nil
                                      lang:nil
                                    locale:nil
                                resultType:@"recent"
                                     count:@"10"
                                     until:nil
                                   sinceID:nil
                                     maxID:nil
                           includeEntities:[NSNumber numberWithInt:1]
                                  callback:nil
                              successBlock:^(NSDictionary *searchMetadata, NSArray *statuses)
         {
             
             //Stopping the progress bar
             [indicatorView stopAnimating];
             
             DisplayResultsDetailViewController* displayResultsDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DisplayResultsDetailViewController"];
             
             NSMutableArray *array = [[NSMutableArray alloc]init];
             
             //Filter for tweets that have a URL
             for(NSDictionary * object in statuses){
                 if([[[object objectForKey:@"entities"] objectForKey:@"urls"] count] >0)
                     [array addObject:[[[[object objectForKey:@"entities"] objectForKey:@"urls"] objectAtIndex:0] objectForKey:@"expanded_url"]];
             }
             
             if([array count]>0)
             {
             
                 [displayResultsDetailViewController setResultsArray:array];
             
                 [self.navigationController pushViewController:displayResultsDetailViewController animated:YES];
             
             }
             else
             {
                 UIAlertView *notFoundAlertView = [[UIAlertView alloc]initWithTitle:@"Warning!"
                                                                            message:@"No tweets found in your criteria"
                                                                           delegate:self
                                                                  cancelButtonTitle:@"Try Again"
                                                                  otherButtonTitles:nil, nil];
                 [notFoundAlertView show];
                 [self.navigationController popViewControllerAnimated:YES];
             }
             
             
         }
                                errorBlock:^(NSError *error)
         {
             NSLog(@"Error : %@",error);
         }];
        
    }
    errorBlock:^(NSError *error)
    {
        NSLog(@"-- error %@", error);
    }];
}


@end
