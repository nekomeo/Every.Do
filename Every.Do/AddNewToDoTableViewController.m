//
//  AddNewToDoTableViewController.m
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "AddNewToDoTableViewController.h"

@interface AddNewToDoTableViewController ()

@end

@implementation AddNewToDoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
    

- (IBAction)cancel:(id)sender
{
    [self.delegate addNewToDoViewControllerDidCancel:self];
}
- (IBAction)done:(id)sender
{
    ToDo *toDo = [[ToDo alloc] init];
    
    toDo.toDoTitle = self.toDoTextField.text;
    toDo.priorityNumber = [self.priorityTextField.text integerValue];
    toDo.toDoDescription = self.toDoDescriptionTextView.text;
    
    [self.delegate addNewToDoViewControllerDidSave:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)configureCellWithNewToDo:(ToDo *)toDo
{
    self.toDoTextField.text = toDo.toDoTitle;
    self.toDoDescriptionTextView.text = toDo.toDoDescription;
    self.priorityTextField.text = [NSString stringWithFormat:@"%ld", (long)toDo.priorityNumber];
}


@end
