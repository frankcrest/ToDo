//
//  ViewController.m
//  EveryDo
//
//  Created by Frank Chen on 2019-05-14.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ViewController.h"
#import "Todo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Todo* toDoItem1 = [[Todo alloc]init];
    Todo* toDoItem2 = [[Todo alloc]init];
    Todo* toDoItem3 = [[Todo alloc]init];
    
    NSArray* toDoItems = @[toDoItem1, toDoItem2, toDoItem3];
    
}


@end
