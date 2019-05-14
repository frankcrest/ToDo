//
//  DetailViewController.m
//  EveryDo
//
//  Created by Frank Chen on 2019-05-14.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic,strong) UILabel* titleLabel;
@property (nonatomic,strong) UILabel* descriptionLabel;
@property (nonatomic,strong) UILabel* priorityLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    
    self.titleLabel.text = self.todoObject.title;
    self.descriptionLabel.text = self.todoObject.todoDescription;
    self.priorityLabel.text = [NSString stringWithFormat:@"%ld", self.todoObject.priorityNumber];
}

-(void)setupViews{
    UILabel* titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel = titleLabel;
    
    UILabel* descriptionLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.descriptionLabel = descriptionLabel;
    
    UILabel* priorityLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    priorityLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.priorityLabel = priorityLabel;
    
    [self.view addSubview:titleLabel];
    [self.view addSubview: descriptionLabel];
    [self.view addSubview:priorityLabel];
    
    [NSLayoutConstraint activateConstraints:@[[titleLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8],
                                              [titleLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:8],
                                              [titleLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:8],
                                              [titleLabel.heightAnchor constraintEqualToConstant: 20],
                                              [descriptionLabel.leadingAnchor constraintEqualToAnchor:titleLabel.leadingAnchor],
                                              [descriptionLabel.trailingAnchor constraintEqualToAnchor:titleLabel.trailingAnchor],
                                              [descriptionLabel.topAnchor constraintEqualToAnchor:titleLabel.bottomAnchor constant:8],
                                              [descriptionLabel.heightAnchor constraintEqualToConstant:20],
                                              [priorityLabel.leadingAnchor constraintEqualToAnchor:descriptionLabel.leadingAnchor],
                                              [priorityLabel.trailingAnchor constraintEqualToAnchor:descriptionLabel.trailingAnchor],
                                              [priorityLabel.topAnchor constraintEqualToAnchor:descriptionLabel.bottomAnchor constant:8],
                                              [priorityLabel.heightAnchor constraintEqualToConstant:20],
                                              ]];
}



@end
