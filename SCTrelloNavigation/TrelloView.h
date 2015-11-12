//
//  TrelloView.h
//  SCTrelloNavigation
//
//  Created by Yh c on 15/11/5.
//  Copyright © 2015年 Yh c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"
#import "TrelloListTabView.h"
#import "TrelloListView.h"
#import "TrelloListTableView.h"
#import "TrelloListCellItem.h"
#import <UIKit/UIKitDefines.h>

@class TrelloView;

/**
 *  Each board has a parameter called Level, which refers to the height of rectangle displayed in the tab view above
 */
typedef NS_ENUM(NSInteger, SCTrelloBoardLevel) {
    /**
     *  1x
     */
    SCTrelloBoardLevel1 = 0,
    /**
     *  2x
     */
    SCTrelloBoardLevel2,
    /**
     *  3x
     */
    SCTrelloBoardLevel3,
    /**
     *  4x
     */
    SCTrelloBoardLevel4,
    /**
     *  5x
     */
    SCTrelloBoardLevel5
};

@protocol TrelloDataSource <NSObject>

@required

/**
 *  Return how many boards that you are going to display
 *
 *  @param trelloView target trelloView
 *
 *  @return NSInteger
 */
- (NSInteger)numberForBoardsInTrelloView:(TrelloView *)trelloView;

/**
 *  Return how many rows each board is going to display
 *
 *  @param trelloView target trelloView
 *  @param index      index of the target trelloView
 *
 *  @return NSInteger
 */
- (NSInteger)numberForRowsInTrelloView:(TrelloView *)trelloView atBoardIndex:(NSInteger)index;

/**
 *  Return the item that each row in each board is going to display. 
 *  You can extend the TrelloListCellItem model to whatever you want, just customizing your own cell in table view datasource
 *  Enjoy yourself :)
 *
 *  @param trelloView target trelloView
 *  @param index      index of the target trelloView
 *  @param rowIndex   index of the target row
 *
 *  @return TrelloListCellItem
 */
- (TrelloListCellItem *)itemForRowsInTrelloView:(TrelloView *)trelloView atBoardIndex:(NSInteger)index atRowIndex:(NSInteger)rowIndex;

/**
 *  Return title of each board
 *
 *  @param trelloView target trelloView
 *  @param index      index of the target trelloView
 *
 *  @return NSInteger
 */
- (NSString *)titleForBoardsInTrelloView:(TrelloView *)trelloView atBoardIndex:(NSInteger)index;

/**
 *  Return the level of each board
 *
 *  @param trelloView target trelloView
 *  @param index      index of the target trelloView
 *
 *  @return SCTrelloBoardLevel
 */
- (SCTrelloBoardLevel)levelForRowsInTrelloView:(TrelloView *)trelloView atBoardIndex:(NSInteger)index;

@end

@interface TrelloView : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) TrelloListTabView *tabView;
@property (nonatomic, strong) TrelloListView *listView;
@property (nonatomic) BOOL isFoldedMode;
@property (nonatomic, weak) id<TrelloDataSource> dataSource;

/**
 *  Init method for newer version
 *
 *  @param frame      frame
 *  @param dataSource dataSource
 *
 *  @return
 */
- (id)initWithFrame:(CGRect)frame dataSource:(id)dataSource;

- (void)switchMode;

/**
 *  Dynamic refresh data source using this method
 */
- (void)reloadData;
@end
