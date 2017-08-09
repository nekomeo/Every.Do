//
//  ToDo.m
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithTitle:(NSString *)toDoTitle withDescription:(NSString *)toDoDescription priorityNumber:(NSInteger)priorityNumber
{
    self = [super init];
    if (self)
    {
        _toDoTitle = toDoTitle;
        _toDoDescription = toDoDescription;
        _priorityNumber = priorityNumber;
        _isCompleted = NO;
    }
    return self;
}

@end
