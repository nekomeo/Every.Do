//
//  DetailViewController.m
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDo.h"
#import "AddNewToDoTableViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.taskTitleDetailLabel.text = [self.detailItem toDoTitle];
        
        self.taskDescriptionTextView.text = [self.detailItem toDoDescription];

        NSString *complete = [NSString stringWithFormat:@"Complete %s", [self.detailItem isCompleted]? "YES" : "NO"];
        
        self.taskCompleteDetailLabel.text = complete;
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
