//
//  AddNewToDoTableViewController.h
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@interface AddNewToDoTableViewController : UITableViewController

@property (nonatomic, weak) id <AddNewToDoViewControllerDelegate> delegate;

@end
