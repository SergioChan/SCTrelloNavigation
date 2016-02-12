# SCTrelloNavigation
An iOS native implementation of a Trello Animated Navigation. See more at https://dribbble.com/shots/2114816-Trello-Navigation. 

iOS上类似trello的导航动效控件实现。

> *最新的Swift实现已经由[小青同学](https://github.com/DianQK)完成：[SwiftTrelloNavigation](https://github.com/DianQK/TrelloNavigation)*

## Preview 
![image](https://raw.githubusercontent.com/SergioChan/SCTrelloNavigation/master/Image/preview.png)

![image](https://raw.githubusercontent.com/SergioChan/SCTrelloNavigation/master/Image/previewgif.gif)

## Intro

设计创意和动效全部来自于[Aurélien Salomon](https://dribbble.com/aureliensalomon)在Dribbble上的作品：[https://dribbble.com/shots/2114816-Trello-Navigation](https://dribbble.com/shots/2114816-Trello-Navigation)。这是一个在iOS上原生实现的相似交互的开源库，没有百分百和设计原稿一致。

这种导航的交互模式可以让你在不同的列表中切换，并且列表的切换对你的干扰可以减少到最小程度。

The design was originated from [Aurélien Salomon](https://dribbble.com/aureliensalomon)'s work on Dribbble:[https://dribbble.com/shots/2114816-Trello-Navigation](https://dribbble.com/shots/2114816-Trello-Navigation). This is an open-sourced iOS-native libray similar to this design, not 100%  equivalent to the original desgin.

This navigation interactive mode can make you easier to switch among different boards, while disturbing you the least when you are switching.
 
## Version
1.1

## Environment
iOS 8.0 以上 iPhone 5s/iPhone6/iPhone6 Plus 测试通过
iOS 8.0 Above iPhone 5s/6/6 Plus Tested
## Usage

初始化整个控件比较简单:

```Objective-C
// 初始化其实只要一句话的
self.trelloView = [[TrelloView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, ScreenWidth, ScreenHeight) dataSource:self];

[self.view addSubview:_trelloView];
```

数据源的加载改为了通过协议的方式完成，你需要总共实现以下这么几条协议：
You should conform to the protocol and implement methods below:

```Objective-C
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
```

新版本还提供了一个`reloadData`的方法用来动态刷新数据源。具体的用法可以参考demo和源代码。

## To Do

* CocoaPods
* TableView reusable




