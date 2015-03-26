//
//  MasterViewController.h
//  MasterDetailDemo
//
//  Created by abruzzim on 3/26/15.
//  Copyright (c) 2015 FWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

