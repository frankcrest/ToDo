//
//  Todo.m
//  EveryDo
//
//  Created by Frank Chen on 2019-05-14.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString *)title withDescription:(NSString *)description withPriority:(NSInteger)priority withDate:(NSDate*)date;
{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = description;
        _priorityNumber = priority;
        _isCompleted = NO;
        _date = date;
    }
    return self;
}


@end
