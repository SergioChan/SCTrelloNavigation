//
//  ViewController.h
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"
#import "UINavigationBar+Awesome.h"
#import "TrelloListTabView.h"
#import "TrelloListView.h"
#import "TrelloView.h"
#import "UIImage+ImageWithColor.h"

@interface ViewController : UIViewController <UIScrollViewDelegate>

//@property (nonatomic,strong) TrelloListTabView *tabView;
//@property (nonatomic,strong) TrelloListView *listView;
@property (nonatomic,strong) TrelloView *trelloView;
@end

