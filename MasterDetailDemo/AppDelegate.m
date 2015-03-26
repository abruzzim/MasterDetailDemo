//
//  AppDelegate.m
//  MasterDetailDemo
//
//  Created by abruzzim on 3/26/15.
//  Copyright (c) 2015 FWS. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"

// The UISplitViewControllerDelegate protocol defines methods that allow you to manage changes to a split view interface.
// Use the methods of this protocol to respond to changes in the current display mode and to the current interface orientation.
// When the split view interface collapses and expands, or when a new view controller is added to the interface, you can
// also use these methods to configure the child view controllers appropriately.
//
@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Log a trace message to the console.
    //
    NSLog(@"%%AppDelegate-I-TRACE, Instance method: application:didFinishLaunchingWithOptions.");

    // Instantiate a container view controller that presents a master-detail interface.
    //
    UISplitViewController *splitVC = (UISplitViewController *)self.window.rootViewController;

    // Return the navigation controller managed by the split-view controller.
    //
    UINavigationController *splitNC = [splitVC.viewControllers lastObject];
    
    // Set a custom bar button item, which changes the display mode of the split view controller,
    // displayed on the left of the navigation bar when the receiver is the top navigation item.
    //
    splitNC.topViewController.navigationItem.leftBarButtonItem = splitVC.displayModeButtonItem;
    
    // Set the delegate to receive split view controller messages.
    //
    splitVC.delegate = self;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

@end
