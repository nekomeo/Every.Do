//
//  AddNewToDoTableViewController.h
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@class DetailViewController;

@protocol AddNewToDoDelegate <NSObject>

//- (void)addNewToDoViewControllerDidCancel:(AddNewToDoTableViewController *)controller;
//- (void)addNewToDoViewControllerDidSave:(AddNewToDoTableViewController *)controller;
//- (void)addNewToDo:(ToDo *)toDoNew;

@end

@interface AddNewToDoTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *toDoTextField;
@property (nonatomic, weak) id <AddNewToDoDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@end
