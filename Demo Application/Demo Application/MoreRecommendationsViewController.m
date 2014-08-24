//
//  MoreRecommendationsViewController.m
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import "MoreRecommendationsViewController.h"
#import "SearchTopicViewController.h"
#import "LoadingViewController.h"

@interface MoreRecommendationsViewController ()

@end

@implementation MoreRecommendationsViewController

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

- (IBAction)yesButtonTapped:(id)sender
{
    LoadingViewController* loadingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoadingViewController"];
    
    //Setting the "SearchQuerry" property
    [loadingViewController setSearchQuerry:[NSString stringWithFormat:@"%@",[Util searchKey]]];
    
    
    [self.navigationController pushViewController:loadingViewController animated:YES];
}

- (IBAction)anotherTopicButtonTapped:(id)sender
{
    SearchTopicViewController* searchTopicViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchTopicViewController"];
    [self.navigationController pushViewController:searchTopicViewController animated:YES];
}
@end
