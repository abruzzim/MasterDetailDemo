//
//  DetailViewController.h
//  MasterDetailDemo
//
//  Created by abruzzim on 3/26/15.
//  Copyright (c) 2015 FWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak,   nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

