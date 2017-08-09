//
//  ToDoTableViewCell.m
//  Every.Do
//
//  Created by Elle Ti on 2017-08-08.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ToDoTableViewCell.h"

@implementation ToDoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWithToDo:(ToDo *)toDo
{
    self.taskLabel.text = toDo.toDoTitle;
    self.descriptionLabel.text = toDo.toDoDescription;
    self.priorityLabel.text = [NSString stringWithFormat:@"%ld", toDo.priorityNumber];
}

@end
