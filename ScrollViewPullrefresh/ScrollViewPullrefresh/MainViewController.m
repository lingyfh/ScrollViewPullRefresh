//
//  MainViewController.m
//  ScrollViewPullrefresh
//
//  Created by yunfenghan Ling on 14-2-19.
//  Copyright (c) 2014年 lingyfh. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
{
    CustomView *customView;
}
@end

@implementation MainViewController

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
    customView = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [customView setDelegate:self];
    [self.view addSubview:customView];
	// Do any additional setup after loading the view.
}

- (void)getDataEnd
{
    [customView pullGetDataEnd];
}

#pragma mark -
#pragma mark CustomViewDelegate
- (void)pullGetData
{
    NSLog(@"pull get data");
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(getDataEnd) userInfo:self repeats:NO];
}

#pragma mark -
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
