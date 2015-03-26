//
//  DetailViewController.m
//  MasterDetailDemo
//
//  Created by abruzzim on 3/26/15.
//  Copyright (c) 2015 FWS. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    
    // Log a trace message to the console.
    //
    NSLog(@"%%DetailViewController-I-TRACE, setDetailItem:");
    
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    
    // Log a trace message to the console.
    //
    NSLog(@"%%DetailViewController-I-TRACE, configureView:");

    // Update the user interface for the detail item.
    //
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Log a trace message to the console.
    //
    NSLog(@"%%DetailViewController-I-TRACE, viewDidLoad:");

    // Do any additional setup after loading the view, typically from a nib.
    //
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
