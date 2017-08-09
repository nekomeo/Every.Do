//
//  AddNewToDoTableViewController.m
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "AddNewToDoTableViewController.h"

@interface AddNewToDoTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *toDoTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property (weak, nonatomic) IBOutlet UITextView *toDoDescriptionTextView;
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
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)done:(id)sender
{
    ToDo *toDo = [self createNewToDo];
    [self.delegate addNewToDo:toDo];
    [self dismissKeyboards];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (ToDo *)createNewToDo
{
    ToDo *newToDo = [[ToDo alloc] init];
    newToDo.toDoTitle = self.toDoTextField.text;
    newToDo.toDoDescription = self.toDoDescriptionTextView.text;
    newToDo.priorityNumber = [self.priorityTextField.text integerValue];
    
    return newToDo;
}

- (void)dismissKeyboards
{
    [self.toDoTextField resignFirstResponder];
    [self.toDoDescriptionTextView resignFirstResponder];
    [self.priorityTextField resignFirstResponder];
}

@end
