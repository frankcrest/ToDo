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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<Todo*>* toDoItems;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   
    Todo* toDoItem1 = [[Todo alloc]initWithTitle:@"eat" withDescription:@"eat chicken and steak" withPriority:1];
    Todo* toDoItem2 = [[Todo alloc]initWithTitle:@"watch tv" withDescription:@"watch nba playoffs" withPriority:2];
    Todo* toDoItem3 = [[Todo alloc]initWithTitle:@"clean dish" withDescription:@"clean dish with dish washer" withPriority:3];
    
    self.toDoItems = [[NSArray alloc]initWithObjects:toDoItem1,toDoItem2,toDoItem3, nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell* cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell"];

    cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"toDoCell"];

    cell.todoTitleLabel.text = self.toDoItems[indexPath.row].title;
    cell.todoDescriptionLabel.text = self.toDoItems[indexPath.row].todoDescription;
    cell.priorityLabel.text = [NSString stringWithFormat:@"%ld", self.toDoItems[indexPath.row].priorityNumber];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}

@end
