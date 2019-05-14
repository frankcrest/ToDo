//
//  CustomCell.m
//  EveryDo
//
//  Created by Frank Chen on 2019-05-14.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.todoTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.todoTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.todoDescriptionLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.todoDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.priorityLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.priorityLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview:self.todoTitleLabel];
        [self addSubview:self.todoDescriptionLabel];
        [self addSubview:self.priorityLabel];
        
        [NSLayoutConstraint activateConstraints:@[
                                                  [self.todoTitleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:8],
                                                  [self.todoTitleLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:8],
                                                  [self.todoTitleLabel.heightAnchor constraintEqualToConstant:20],
                                                  [self.todoTitleLabel.widthAnchor constraintEqualToConstant:100],
                                                  [self.todoDescriptionLabel.topAnchor constraintEqualToAnchor:self.todoTitleLabel.bottomAnchor constant:8],
                                                  [self.todoDescriptionLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:8],
                                                  [self.todoDescriptionLabel.heightAnchor constraintEqualToConstant: 20],
                                                  [self.priorityLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                                  [self.priorityLabel.leadingAnchor constraintEqualToAnchor:self.todoDescriptionLabel.trailingAnchor],
                                                  [self.priorityLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-8],
                                                  [self.priorityLabel.heightAnchor constraintEqualToConstant: 20],
                                                  [self.priorityLabel.widthAnchor constraintEqualToConstant:20],
                                                  ]];
    }
    return self;
}


@end
