//
//  MasterViewController.h
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol AddNewToDoViewControllerDelegate <NSObject>

- (void)addNewToDo:(ToDo *)toDoNew;

@end

@class DetailViewController;

@interface MasterViewController : UITableViewController <AddNewToDoViewControllerDelegate>


@end

