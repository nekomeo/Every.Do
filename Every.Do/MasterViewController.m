//
//  MasterViewController.m
//  Every.Do
//
//  Created by Elle Ti on 2017-06-13.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoTableViewControllerCell.h"
#import "AddNewToDoTableViewController.h"

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource, AddNewToDoDelegate, ToDoTableViewCellDelegate>

@property NSMutableArray *objects;
@property (nonatomic, strong) NSMutableArray *toDoTasks;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;
@property (nonatomic) BOOL markCompleted;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    ToDo *firstItem = [[ToDo alloc] initWithTitle:@"Do Every.Do" withDescription:@"Finish all tasks in assignment" priorityNumber:1];
    ToDo *secondItem = [[ToDo alloc] initWithTitle:@"Freak out about test" withDescription:@"Run around and panic" priorityNumber:2];
    ToDo *thirdItem = [[ToDo alloc] initWithTitle:@"KCCO" withDescription:@"Be zen" priorityNumber:3];
    
    firstItem.isCompleted = YES;
    
    NSArray *toDoArray = @[firstItem, secondItem, thirdItem];
    self.toDoTasks = [NSMutableArray new];
    [self.toDoTasks addObjectsFromArray:toDoArray];
}

- (UIImage *)imageForPriority:(int)priority
{
    switch (priority) {
        case 1: return [UIImage imageNamed:@"1StarSmall"];
        case 2: return [UIImage imageNamed:@"2StarsSmall"];
        case 3: return [UIImage imageNamed:@"3StarsSmall"];
    }
    return nil;
}

- (void)viewWillAppear:(BOOL)animated
{
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender
{
    if (!self.toDoTasks)
    {
        self.toDoTasks = [[NSMutableArray alloc] init];
    }
    
    [self performSegueWithIdentifier:@"NewToDoMenu" sender:self];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        ToDo *todo = self.toDoTasks[indexPath.row];
        
        [controller setDetailItem:todo];
    }
    
    if ([[segue identifier] isEqualToString:@"NewToDoMenu"])
    {
        AddNewToDoTableViewController *newToDoController = (AddNewToDoTableViewController *)[segue destinationViewController];
        
        newToDoController.delegate = self;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.toDoTasks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    ToDoTableViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.delegate = nil;
    
    UISwipeGestureRecognizer *toDoSwiped = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeToComplete:)];
    toDoSwiped.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:toDoSwiped];
    
    ToDo *toDo = self.toDoTasks[indexPath.row];
    
    [cell configureCellWithToDo:toDo];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Index row %ld tapped", (long)indexPath.row);
    self.selectedIndexPath = indexPath;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)addNewToDo:(ToDo *)toDoNew
{
    NSLog(@"in new todo %@", toDoNew);
    if (toDoNew)
    {
        [self.toDoTasks addObject:toDoNew];
        [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoTasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)toDoTableViewCellSwiped:(ToDoTableViewControllerCell *)cell
{
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    int swiped = (int)path.row;
    ToDo *toDo = self.toDoTasks[swiped];
    toDo.isCompleted = YES;
    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)swipeToComplete:(UISwipeGestureRecognizer *)swipeGesture
{
    CGPoint location = [swipeGesture locationInView:self.tableView];
    NSIndexPath *swipedIndex = [self.tableView indexPathForRowAtPoint:location];
    UITableViewCell *swipedCell = [self.tableView cellForRowAtIndexPath:swipedIndex];
    
    NSLog(@"This was swiped at %@", swipedIndex);
    
    // ************** Get to strikethrough
//    if (_toDoTasks == _markCompleted)
//    {
//        NSMutableAttributedString *completedToDoTitle = [[NSMutableAttributedString alloc] initWithString:self.title attributes:@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
//    }
}

@end
