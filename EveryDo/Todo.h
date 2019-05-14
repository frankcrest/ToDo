//
//  Todo.h
//  EveryDo
//
//  Created by Frank Chen on 2019-05-14.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Todo : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* todoDescription;
@property (nonatomic, assign) NSInteger priorityNumber;
@property (nonatomic, assign) BOOL isCompleted;

-(instancetype)initWithTitle:(NSString*)title withDescription:(NSString*)description withPriority:(NSInteger)priority;

@end

NS_ASSUME_NONNULL_END
