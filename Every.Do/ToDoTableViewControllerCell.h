//
//  ToDoTableViewControllerCell.h
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@class ToDoTableViewControllerCell;
@protocol ToDoTableViewCellDelegate <NSObject>

- (void)toDoTablViewCellWasSwiped:(ToDoTableViewControllerCell *)cell;

@end

@interface ToDoTableViewControllerCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *priorityImage;
@property (nonatomic, weak) id <ToDoTableViewCellDelegate> delegate;

-(void)configureCellWithToDo:(ToDo *)toDo;

@end
