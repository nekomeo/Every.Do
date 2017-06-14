//
//  ToDo.h
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic) NSString *toDoTitle;
@property (nonatomic) NSString *toDoDescription;
@property (nonatomic) NSInteger priorityNumber;
@property (nonatomic) BOOL isCompleted;

- (instancetype)initWithTitle:(NSString *)toDoTitle withDescription:(NSString *)toDoDescription priorityNumber:(int)priorityNumber;

@end
