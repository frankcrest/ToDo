//
//  AddToDoViewController.h
//  EveryDo
//
//  Created by Frank Chen on 2019-05-14.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

NS_ASSUME_NONNULL_BEGIN
@protocol AddToDoDelegate <NSObject>

-(void)addNewToDoWithTitle:(NSString*)title withDescription:(NSString*)description withPriority:(NSInteger)priority;

@end

@interface AddToDoViewController : UIViewController

@property (nonatomic, weak) id<AddToDoDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
