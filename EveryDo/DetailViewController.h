//
//  DetailViewController.h
//  EveryDo
//
//  Created by Frank Chen on 2019-05-14.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (nonatomic,strong) Todo* todoObject;

@end

NS_ASSUME_NONNULL_END
