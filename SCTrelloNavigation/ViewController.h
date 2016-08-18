//
//  ViewController.h
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCTrelloNavigation.h"

@interface ViewController : UIViewController <UIScrollViewDelegate,TrelloDataSource>

@property (nonatomic, strong) TrelloView *trelloView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

