## ViewGuide

辅助查看View的 宽高属性 再也不担心设计师找我1像素的梗了


##  先上效果  ShowCase 


![Demo1](https://github.com/aiqiuqiu/ViewGuide/blob/master/Demo1.gif)

![D2mo2](https://github.com/aiqiuqiu/ViewGuide/blob/master/Demo2.png)

![D2mo2](https://github.com/aiqiuqiu/ViewGuide/blob/master/Demo3.png)

> 之前项目中用到了 这个牛人 [tapthaker](https://github.com/tapthaker) 的库[DebugView](https://github.com/tapthaker/DebugView)

但是发现该大牛已经不再更新了  而且这个库在 AutoLayout的情况下 支持并不是很好  所以我就重构了一下

#warning  过两天我会把其中踩过的坑和原理总结一下 放在我的[简书](http://www.jianshu.com/users/cc1e4faec5f7/)


## How To Usage  
1.  将ViewGuide 拖进项目中即可 

2.   pod 'ViewGuide', '~> 1.0.0'

3.  关闭ViewGuide 


> 在//  UIView+ViewGuide.h文件中 打开//#define  ViewGuideMarco 这个宏定义   或者在pch文件中 定义这个宏

----



## Knows Issues  
>
1 此Debug工具支持StoryBoard 实时渲染  ，如果项目中 StoryBoard 或者nib文件较多 ，造成卡顿 可注释  UIView+ViewGuide.h文件中 IB_DESIGNABLE 这个编译器指令

> 2 如果你的控制器实现了这个方法 



                    - (void)viewDidLayoutSubviews {
                              [super viewDidLayoutSubviews];
                    }
          
          
> 请一定调用super的实现.  因为这个方法在UIViewController实现为空，所以无法用Runtime的黑魔法hook到






###  重大更新  
群里的朋友说我的印象笔记导出太大  非会员无法导入      
我现在逐条 导入了一下 放在books 文件夹下 [GO]()
