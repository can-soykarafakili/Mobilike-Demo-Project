//
//  LoginViewController.m
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import "LoginViewController.h"
#import "SearchTopicViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize loginLabel,loginWithTwitterButton;

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

- (IBAction)loginWtihTwitter:(id)sender
{
    //Preventing multiple taps
    [self.loginWithTwitterButton setEnabled:FALSE];
    
    STTwitterAPI *twitter = [STTwitterAPI twitterAPIWithOAuthConsumerName:nil
                                                              consumerKey: [Util consumerKey]
                                                           consumerSecret:[Util consumerSecret]];
    
    [twitter postReverseOAuthTokenRequest:^(NSString *authenticationHeader)
    {
        
        STTwitterAPI *twitterAPIOS = [STTwitterAPI twitterAPIOSWithFirstAccount];
        
        [twitterAPIOS verifyCredentialsWithSuccessBlock:^(NSString *username)
        {
            
            //If Login is successful then navigate to the searching
            
            SearchTopicViewController* searchTopicViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchTopicViewController"];
            [self.navigationController pushViewController:searchTopicViewController animated:YES];
            
        }
        errorBlock:^(NSError *error)
        {
            //If Login fails then warn user to enter his/her account informations.
            
            NSLog(@"%@",error.debugDescription);
            
            //Allowing to loggin in again
            [self.loginWithTwitterButton setEnabled:TRUE];

            
            UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"Warning!"
                                                                message:@"Please Login To Your Twitter Account Using Settings."
                                                                delegate:self
                                                       cancelButtonTitle:@"Okay"
                                                       otherButtonTitles:nil, nil];
            
            [loginAlert show];
        }
        ];
        
    }
    errorBlock:^(NSError *error)
    {
        NSLog(@"%@",error.debugDescription);
    }
    ];
}
@end
