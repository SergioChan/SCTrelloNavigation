# SCTrelloNavigation
An iOS native implementation of a Trello Animated Navagation. See more at https://dribbble.com/shots/2114816-Trello-Navigation. iOS上类似trello的导航动效控件实现。

## Preview 
![image](https://raw.githubusercontent.com/SergioChan/SCTrelloNavigation/master/Image/previewgif.gif)
## Intro

设计创意和动效全部来自于[Aurélien Salomon](https://dribbble.com/aureliensalomon)在Dribble上的作品：[https://dribbble.com/shots/2114816-Trello-Navigation](https://dribbble.com/shots/2114816-Trello-Navigation)。在iOS上原生的相似交互的开源库，没有百分百和设计原稿一致。

这种导航的交互模式可以让你在不同的列表中切换，并且列表的切换对你的干扰可以减少到最小程度。

## Version
V1.0

## Usage

初始化十分简单，但是整个控件需要接受的数据比较复杂，都是自定义的数据模型。

```Objective-C

    TrelloListCellItem *cell_item_1_3 = [[TrelloListCellItem alloc] initWithContent:@"Have a pleasant afternoon" image:[UIImage imageNamed:@"testImage3"] type:SCTrelloCellItemRed];

    TrelloListItem *item_1 = [[TrelloListItem alloc]initWithTitle:@"BACKLOG" level:3 rowNumber:3 rowItems:t_array_1];

    // 初始化其实只要一句话的
    TrelloView *trelloView = [[TrelloView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, ScreenWidth, ScreenHeight) listArray:@[item_1,item_2,item_3,item_4,item_5]];
```

## To Do

* CocoaPods
* TableView的复用
* 文档整理




