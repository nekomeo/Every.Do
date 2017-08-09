//
//  ToDoTableViewCell.h
//  Every.Do
//
//  Created by Elle Ti on 2017-08-08.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@class ToDoTableViewCell;

@protocol ToDoTableViewCellDelegate <NSObject>

- (void)tableViewCellWasSwiped:(ToDoTableViewCell *)cell;

@end

@interface ToDoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

-(void)configureCellWithToDo:(ToDo *)toDo;

@end
