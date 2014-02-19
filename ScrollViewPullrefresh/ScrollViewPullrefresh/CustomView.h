//
//  CustomView.h
//  ScrollViewPullrefresh
//
//  Created by yunfenghan Ling on 14-2-19.
//  Copyright (c) 2014年 lingyfh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@protocol CustomViewDelegate <NSObject>

- (void)pullGetData;

@end

@interface CustomView : UIView <UIScrollViewDelegate, EGORefreshTableHeaderDelegate>

@property (assign, nonatomic) id<CustomViewDelegate> delegate;

- (void)pullGetDataEnd;

@end
