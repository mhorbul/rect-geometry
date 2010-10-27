//
//  HelpPrototypeAppDelegate.h
//  HelpPrototype
//
//  Created by mhorbul on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelpPrototypeViewController;

@interface HelpPrototypeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HelpPrototypeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HelpPrototypeViewController *viewController;

@end

