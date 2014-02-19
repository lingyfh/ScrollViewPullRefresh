//
//  CustomView.m
//  ScrollViewPullrefresh
//
//  Created by yunfenghan Ling on 14-2-19.
//  Copyright (c) 2014年 lingyfh. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()
{
    UIScrollView *contentScrollView;
    
    EGORefreshTableHeaderView *refreshTableView;
    BOOL _isReloading;
    
}
@end

@implementation CustomView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    refreshTableView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    [refreshTableView setDelegate:self];
    [refreshTableView refreshLastUpdatedDate];
    
    contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, 320, 480)];
    [contentScrollView setDelegate:self];
    [contentScrollView setContentSize:CGSizeMake(320, 1700)];
    [contentScrollView addSubview:refreshTableView];
    [self addSubview:contentScrollView];
}

- (void)pullGetDataEnd
{
    [self doneLoadingTableViewData];
}

#pragma mark -
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (refreshTableView == nil) {
        return;
    }
    [refreshTableView egoRefreshScrollViewDidScroll:scrollView];
}

#pragma mark -
#pragma mark EGORefresh
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (refreshTableView == nil) {
        return;
    }
    [refreshTableView egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
- (void)reloadTableViewDataSource
{
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_isReloading = YES;
}
- (void)doneLoadingTableViewData
{
	//  model should call this when its done loading
	_isReloading = NO;
    if (refreshTableView == nil) {
        return;
    }
    [refreshTableView egoRefreshScrollViewDataSourceDidFinishedLoading:contentScrollView];
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
{
	[self reloadTableViewDataSource];
    if (delegate) {
        [delegate pullGetData];
    }
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
{
	return _isReloading; // should return if data source model is reloading
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view
{
	return [NSDate date]; // should return date data source was last changed
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
