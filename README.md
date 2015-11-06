# SCTrelloNavigation
An iOS native implementation of a Trello Animated Navagation. See more at https://dribbble.com/shots/2114816-Trello-Navigation. iOS上类似trello的导航动效控件实现。

## Preview 
![image](https://raw.githubusercontent.com/SergioChan/SCTrelloNavigation/master/Image/preview.png)

![image](https://raw.githubusercontent.com/SergioChan/SCTrelloNavigation/master/Image/previewgif.gif)

## Intro

设计创意和动效全部来自于[Aurélien Salomon](https://dribbble.com/aureliensalomon)在Dribble上的作品：[https://dribbble.com/shots/2114816-Trello-Navigation](https://dribbble.com/shots/2114816-Trello-Navigation)。这是一个在iOS上原生实现的相似交互的开源库，没有百分百和设计原稿一致。

这种导航的交互模式可以让你在不同的列表中切换，并且列表的切换对你的干扰可以减少到最小程度。

## Version
1.0

## Environment
iOS 8.0 以上 iPhone6/iPhone6 plus 测试通过

## Usage

初始化十分简单，但是整个控件需要接受的数据比较复杂，都是自定义的数据模型。

```Objective-C

TrelloListCellItem *cell_item_1 = [[TrelloListCellItem alloc] initWithContent:@"Have a pleasant afternoon" image:[UIImage imageNamed:@"testImage3"] type:SCTrelloCellItemRed];

TrelloListItem *item = [[TrelloListItem alloc]initWithTitle:@"BACKLOG" level:3 rowNumber:3 rowItems:t_array];

// 初始化其实只要一句话的
TrelloView *trelloView = [[TrelloView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, ScreenWidth, ScreenHeight) listArray:@[item]];
```
具体的初始化可以看demo中的示范，由于初始化的时候需要将整个view的数据源都传入，所以代码比较多。

## To Do

* CocoaPods
* TableView的复用
* 文档整理




