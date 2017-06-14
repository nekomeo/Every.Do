//
//  ToDoTableViewControllerCell.m
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ToDoTableViewControllerCell.h"

@implementation ToDoTableViewControllerCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWithToDo:(ToDo *)toDo
{
    self.taskLabel.text = toDo.toDoTitle;
    self.descriptionLabel.text = toDo.toDoDescription;
    self.priorityLabel.text = [NSString stringWithFormat:@"%ld", (long)toDo.priorityNumber];
}



@end
