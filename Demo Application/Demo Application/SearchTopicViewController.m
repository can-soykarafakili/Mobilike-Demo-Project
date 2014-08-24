//
//  SearchTopicViewController.m
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import "SearchTopicViewController.h"
#import "LoadingViewController.h"

@interface SearchTopicViewController ()

@end

@implementation SearchTopicViewController

@synthesize informationLabel,readTweetButton,topicTextField;

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


- (IBAction)findTweetsWithTheTopic:(id)sender
{
    
    LoadingViewController* loadingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoadingViewController"];
    
    //Setting the "SearchQuerry" property
    [Util setSearchKey:self.topicTextField.text];
    [loadingViewController setSearchQuerry:[NSString stringWithFormat:@"%@",self.topicTextField.text]];

    [self.navigationController pushViewController:loadingViewController animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.topicTextField.text = @"";
}
@end
