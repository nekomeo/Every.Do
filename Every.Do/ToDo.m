//
//  ToDo.m
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithTitle:(NSString *)toDoTitle withDescription:(NSString *)toDoDescription priorityNumber:(int)priorityNumber
{
    self = [super init];
    if (self)
    {
        self.toDoTitle = toDoTitle;
        self.toDoDescription = toDoDescription;
        self.priorityNumber = priorityNumber;
        self.isCompleted = NO;
    }
    return self;
}

@end
