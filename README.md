# SCTrelloNavigation
An iOS native implementation of a Trello Animated Navagation. See more at https://dribbble.com/shots/2114816-Trello-Navigation. 

iOS上类似trello的导航动效控件实现。

## Preview 
![image](https://raw.githubusercontent.com/SergioChan/SCTrelloNavigation/master/Image/preview.png)

![image](https://raw.githubusercontent.com/SergioChan/SCTrelloNavigation/master/Image/previewgif.gif)

## Intro

设计创意和动效全部来自于[Aurélien Salomon](https://dribbble.com/aureliensalomon)在Dribbble上的作品：[https://dribbble.com/shots/2114816-Trello-Navigation](https://dribbble.com/shots/2114816-Trello-Navigation)。这是一个在iOS上原生实现的相似交互的开源库，没有百分百和设计原稿一致。

这种导航的交互模式可以让你在不同的列表中切换，并且列表的切换对你的干扰可以减少到最小程度。

The design was originated from [Aurélien Salomon](https://dribbble.com/aureliensalomon)'s work on Dribbble:[https://dribbble.com/shots/2114816-Trello-Navigation](https://dribbble.com/shots/2114816-Trello-Navigation). This is an open-sourced iOS-native libray similar to this design, not 100%  equivalent to the original desgin.

This navigation interactive mode can make you easier to switch among different boards, while disturbing you the least when you are switching.
 
## Version
1.0

## Environment
iOS 8.0 以上 iPhone 5s/iPhone6/iPhone6 Plus 测试通过
iOS 8.0 Above iPhone 5s/6/6 Plus Tested
## Usage

初始化十分简单，但是整个控件需要接受的数据比较复杂，都是自定义的数据模型。

The initialization is very simple, you need to pass over the whole data source to the view, which all have specific data structure.

```Objective-C

TrelloListCellItem *cell_item_1 = [[TrelloListCellItem alloc] initWithContent:@"Have a pleasant afternoon" image:[UIImage imageNamed:@"testImage3"] type:SCTrelloCellItemRed];

TrelloListItem *item = [[TrelloListItem alloc]initWithTitle:@"BACKLOG" level:3 rowNumber:3 rowItems:t_array];

// 初始化其实只要一句话的
TrelloView *trelloView = [[TrelloView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, ScreenWidth, ScreenHeight) listArray:@[item]];
```
具体的初始化可以看demo中的示范，由于初始化的时候需要将整个view的数据源都传入，所以代码比较多。

You can download the demo to see detailed code for initialization.

## To Do

* CocoaPods
* TableView reusable
* Document




