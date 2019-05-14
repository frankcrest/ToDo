//
//  AddToDoViewController.m
//  EveryDo
//
//  Created by Frank Chen on 2019-05-14.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "AddToDoViewController.h"

@interface AddToDoViewController ()

@property (nonatomic, strong) UITextField* titleTextField;
@property (nonatomic, strong) UITextField* descriptionTextField;
@property (nonatomic, strong) UITextField* priorityTextField;
@property (nonatomic, strong) UIButton* submitButton;
@property (nonatomic, strong) Todo* TodoItem;

@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
}

-(void)setupViews{
    UITextField* titleTextField = [[UITextField alloc]initWithFrame:CGRectZero];
    titleTextField.translatesAutoresizingMaskIntoConstraints = NO;
    titleTextField.backgroundColor = [UIColor lightGrayColor];
    titleTextField.placeholder = @"enter a title";
    self.titleTextField = titleTextField;
    
    UITextField* descriptionTextField = [[UITextField alloc]initWithFrame:CGRectZero];
    descriptionTextField.translatesAutoresizingMaskIntoConstraints = NO;
    descriptionTextField.backgroundColor = [UIColor lightGrayColor];
    descriptionTextField.placeholder = @"enter a description";
    self.descriptionTextField = descriptionTextField;;
    
    UITextField* priorityTextField = [[UITextField alloc]initWithFrame:CGRectZero];
    priorityTextField.translatesAutoresizingMaskIntoConstraints = NO;
    priorityTextField.backgroundColor = [UIColor lightGrayColor];
    priorityTextField.placeholder = @"enter a priority, e.g 1,2,3";
    self.priorityTextField = priorityTextField;
    
    UIButton* submitButton = [[UIButton alloc]initWithFrame:CGRectZero];
    submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [submitButton setTitle:@"submit" forState:UIControlStateNormal];
    submitButton.backgroundColor = [UIColor blueColor];
    [submitButton addTarget:self action:@selector(submitTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.submitButton = submitButton;
    
    [self.view addSubview:titleTextField];
    [self.view addSubview:descriptionTextField];
    [self.view addSubview: priorityTextField];
    [self.view addSubview:submitButton];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [titleTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:8],
                                              [titleTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-8],
                                              [titleTextField.heightAnchor constraintEqualToConstant:20],
                                              [titleTextField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8],
                                              [descriptionTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:8],
                                              [descriptionTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-8],
                                              [descriptionTextField.heightAnchor constraintEqualToConstant:20],
                                              [priorityTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:8],
                                              [priorityTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-8],
                                              [priorityTextField.heightAnchor constraintEqualToConstant:20],
                                              [descriptionTextField.topAnchor constraintEqualToAnchor:titleTextField.bottomAnchor constant:8],
                                              [priorityTextField.topAnchor constraintEqualToAnchor:descriptionTextField.bottomAnchor constant:8],
                                              [submitButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:8],
                                              [submitButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:8],
                                              [submitButton.topAnchor constraintEqualToAnchor:priorityTextField.bottomAnchor constant:8],
                                              ]];
}

-(void)submitTapped:(UIButton*)sender{
    NSLog(@"tapped");
    NSString* titleString = self.titleTextField.text;
    NSString* descriptionString = self.descriptionTextField.text;
    NSString* priorityString = self.priorityTextField.text;
    NSInteger priorityInt = [priorityString integerValue];
    
    [_delegate addNewToDoWithTitle:titleString withDescription:descriptionString withPriority:priorityInt];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
