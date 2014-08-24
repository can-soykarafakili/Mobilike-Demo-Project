//
//  LoadingViewController.h
//  Demo Application
//
//  Created by Can SOYKARAFAKILI on 24.08.2014.
//  Copyright (c) 2014 Can SOYKARAFAKILI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"
#import "MONActivityIndicatorView.h"

@interface LoadingViewController : UIViewController

{
    MONActivityIndicatorView *indicatorView;
}

//Defining properties
@property (nonatomic,strong) NSString* searchQuerry;

@end
