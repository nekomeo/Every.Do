//
//  DetailViewController.h
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol DetailViewControllerDelegate <NSObject>

- (void)sendToDo:(ToDo *)toDo;

@end

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UITextView *taskDescriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *taskTitleDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskCompleteDetailLabel;
@property (nonatomic, strong) ToDo *toDo;

- (void)setDetailItem:(id)newDetailItem;

@end

