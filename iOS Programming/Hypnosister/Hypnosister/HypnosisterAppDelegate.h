//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Adam Chamberlin on 11/11/2013.
//  Copyright (c) 2013 Adam Chamberlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisterView.h"

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    HypnosisterView *view;
}

@property (strong, nonatomic) UIWindow *window;

@end
