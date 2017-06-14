//
//  AddNewTaskTableViewController.h
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol AddNewTaskDelegate <NSObject>
//- (void)newTitle:(NSString *)title withDescription:(NSString *)toDoDescription priorityNumber:(NSInteger)priorityNumber;
- (void)addNewToDo:(ToDo *)toDoNew;

@end

@interface AddNewTaskTableViewController : UITableViewController
@property (nonatomic, weak) id <AddNewTaskDelegate> delegate;
@property (strong, nonatomic) id detailItem;
@property (nonatomic) ToDo *toDo;

@end
