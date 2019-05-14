//
//  ViewController.m
//  EveryDo
//
//  Created by Frank Chen on 2019-05-14.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ViewController.h"
#import "Todo.h"
#import "CustomCell.h"
#import "DetailViewController.h"
#import "AddToDoViewController.h"

@interface ViewController () <AddToDoDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<Todo*>* toDoItems;
@property (nonatomic,strong) NSMutableArray <Todo*>* completedToDoItems;
@property (nonatomic,strong) NSMutableArray<NSArray<Todo*>*>* toDoCategories;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"toDoCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   
    Todo* toDoItem3 = [[Todo alloc]initWithTitle:@"clean dish" withDescription:@"clean dish with dish washer" withPriority:3 withDate:[NSDate new]];
     Todo* toDoItem2 = [[Todo alloc]initWithTitle:@"watch tv" withDescription:@"watch nba playoffs" withPriority:2 withDate:[NSDate new]];
      Todo* toDoItem1 = [[Todo alloc]initWithTitle:@"eat" withDescription:@"eat chicken and steak" withPriority:1 withDate:[NSDate new]];
    
    self.toDoItems = [[NSMutableArray alloc]initWithObjects:toDoItem1,toDoItem2,toDoItem3, nil];
    
    UISwipeGestureRecognizer* swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipedTableView:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.tableView addGestureRecognizer:swipeGesture];
    
    self.completedToDoItems = [[NSMutableArray alloc]init];
    self.toDoCategories = [[NSMutableArray alloc]init];
    [self.toDoCategories addObject:self.toDoItems];
    [self.toDoCategories addObject:self.completedToDoItems];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.toDoCategories count];;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.toDoCategories[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell* cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell"];

    cell.todoTitleLabel.text = self.toDoCategories[indexPath.section][indexPath.row].title;
    cell.todoDescriptionLabel.text = self.toDoCategories[indexPath.section][indexPath.row].todoDescription;
    cell.priorityLabel.text = [NSString stringWithFormat:@"%ld", self.toDoCategories[indexPath.section][indexPath.row].priorityNumber];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    NSInteger sourceIndex = sourceIndexPath.row;
    NSInteger destinationIndex = destinationIndexPath.row;
    
    Todo* destinationObject = self.toDoItems[destinationIndex];
    
    [self.toDoItems replaceObjectAtIndex:destinationIndex withObject:self.toDoItems[sourceIndex]];
    [self.toDoItems replaceObjectAtIndex:sourceIndex withObject:destinationObject];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"showDetailSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showDetailSegue"]) {
        DetailViewController* dvc = [segue destinationViewController];
        
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        
        Todo* todoItem = self.toDoItems[indexPath.row];
        
        dvc.todoObject = todoItem;
    } else{
        if ([segue.identifier isEqualToString:@"addToDoSegue"]) {
            AddToDoViewController* dvc = [segue destinationViewController];
            dvc.delegate = self;
        }
    }
}

- (IBAction)addItemPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"addToDoSegue" sender:self];
}

- (void)addNewToDoWithTitle:(NSString *)title withDescription:(NSString *)description withPriority:(NSInteger)priority withDate:(NSDate*)date{
    Todo* newTodo = [[Todo alloc]initWithTitle:title withDescription:description withPriority:priority withDate:date];
    [self.toDoItems addObject:newTodo];
}

-(void)swipedTableView:(UISwipeGestureRecognizer*)sender{
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint location = [sender locationInView:self.tableView];
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
        NSLog(@"%ld", indexPath.row);
        
        if (indexPath.section == 0) {
            self.toDoItems[indexPath.row].isCompleted = YES;
            
            Todo* completedTodo = self.toDoItems[indexPath.row];
            NSLog(@"%@", completedTodo.title);
            [self.completedToDoItems addObject:completedTodo];
            [self.toDoItems removeObjectAtIndex:indexPath.row];
            
            //[self sortArray];
            [self.tableView reloadData];
        } else if (indexPath.section == 1){
            self.completedToDoItems[indexPath.row].isCompleted = YES;
            
            Todo* uncompleteTodo = self.completedToDoItems[indexPath.row];
            [self.toDoItems addObject:uncompleteTodo];
            [self.completedToDoItems removeObjectAtIndex:indexPath.row];
            
            //[self sortArray];
            [self.tableView reloadData];
        }
    }
}

-(void)sortArrayByDate{
    NSSortDescriptor* sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"date" ascending:NO];
    [self.toDoItems sortUsingDescriptors:@[sortDescriptor]];
}

-(void)sortArrayByImportance{
    NSSortDescriptor* sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"priorityNumber" ascending:YES];
    [self.toDoItems sortUsingDescriptors:@[sortDescriptor]];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoItems removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}
- (IBAction)editPressed:(UIBarButtonItem *)sender {
    [self.tableView setEditing:!self.tableView.editing];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"To do items";
    } else if (section == 1){
        return @"completed";
    } else{
        return @"";
    }
}

- (IBAction)segmentControlChanged:(UISegmentedControl *)sender {
    if (self.segmentControl.selectedSegmentIndex == 0) {
        [self sortArrayByDate];
        [self.tableView reloadData];
    } else if (self.segmentControl.selectedSegmentIndex == 1){
        NSLog(@"log");
        [self sortArrayByImportance];
        [self.tableView reloadData];
    }
}

@end
