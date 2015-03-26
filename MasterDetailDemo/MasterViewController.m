//
//  MasterViewController.m
//  MasterDetailDemo
//
//  Created by abruzzim on 3/26/15.
//  Copyright (c) 2015 FWS. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *dataObjects;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Log a trace message tothe console.
    //
    NSLog(@"%%MasterViewController-I-TRACE, awakeFromNib:");
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        // Preserve selection between presentations.
        //
        self.clearsSelectionOnViewWillAppear = NO;
        
        // // Set the preferred size for the master view controller’s view.
        //
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    
    // Log a trace message to the console.
    //
    NSLog(@"%%MasterViewController-I-TRACE, viewDidLoad:");

    // Display an Edit button in the navigation bar for this view controller.
    //
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    // Display an Add button in the navigation bar for this view controller.
    //
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    // Master VC's split view controller's last managed view controller.
    //
    self.detailVC = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    
    // Log a trace message to the console.
    //
    NSLog(@"%%MasterViewController-I-TRACE, insertNewObject:");
    
    // If the mutable array does not exist then create it.
    //
    if (!self.dataObjects) {
        self.dataObjects = [[NSMutableArray alloc] init];
    }
    
    // Create a data object.
    //
    NSDate *dataObject = [NSDate date];
    
    // Insert the new data object as the first element of the mutable array.
    //
    [self.dataObjects insertObject:dataObject atIndex:0];
    
    // Returns an index-path object initialized with the indexes of a specific row
    // and section in the table view.
    //
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];

    // Insert the row in the table view at the locations identified by
    // an array of index-paths, with an option to animate the insertion.
    //
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

// In a storyboard-based application, perform optional preparation before navigation
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Log a trace message to the console.
    //
    NSLog(@"%%MasterViewController-I-TRACE, prepareForSegue:sender:");
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        // Return the index path identifying the row and section of the selected row.
        //
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        // Return the data object from the objects array that corresponds to the table row that was selected.
        //
        NSDate *dataObject = self.dataObjects[indexPath.row];
        
        // Instantiate a view controller at the top of the navigation stack that is the segue's destination view controller.
        //
        DetailViewController *detailVC = (DetailViewController *)[[segue destinationViewController] topViewController];
        
        // Pass the data object to the detail view controller.
        //
        [detailVC setDetailItem:dataObject];
        
        // Display a custom bar button item on the left of the navigation bar when the receiver is the top navigation item.
        //
        detailVC.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        
        // Display the custom bar button item to the right of the back button.
        //
        detailVC.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Log a trace message to the console.
    //
    NSLog(@"%%MasterViewController-I-TRACE, numberOfSectionsInTableView:");

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Log a trace message to the console.
    //
    NSLog(@"%%MasterViewController-I-TRACE, tableView:numberOfRowsInSection:");

    return self.dataObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Log a trace message to the console.
    //
    NSLog(@"%%MasterViewController-I-TRACE, tableView:cellForRowAtIndexPath:");

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                            forIndexPath:indexPath];
    
    // Return the data object corresponding to the index path row.
    //
    NSDate *dataObject = self.dataObjects[indexPath.row];
    
    // Set the cell's text label to the string representation of the DATE object.
    //
    cell.textLabel.text = [dataObject description];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Log a trace message to the console.
    //
    NSLog(@"%%MasterViewController-I-TRACE, tableView:canEditRowAtIndexPath:");

    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Log a trace message to the console.
    //
    NSLog(@"%%MasterViewController-I-TRACE, tableView:commitEditingStyle:forRowAtIndexPath:");

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Remove the array element that corresponds to the selected row.
        //
        [self.dataObjects removeObjectAtIndex:indexPath.row];
        
        // Delete the row specified by the index path row.
        //
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        
    }
}

@end
