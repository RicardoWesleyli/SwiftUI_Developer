简体中文 ｜ [English](https://github.com/RicardoWesleyli/SwiftUI_Developer/blob/main/README.md)

### 内容提要

本书从实战案例出发，系统性地讲解Swift+SwiftUI 开发的全过程，全书内容丰富且实用性强，旨在帮助读者快速上手学习。

本书分为14个精心规划的章节，从SwiftUI的基础概念开始，逐渐深入分享了视图创建、视图修饰符的使用、视图布局、数据绑定、动画效果、网络请求、数据持久化等各个关键主题，为读者提供了全面的理论知识和实际应用的技巧。

该书适合对SwiftUI应用开发感兴趣的开发者阅读，无论你是初学者还是有一定经验的开发者，都能够通过本书全面了解SwiftUI的基础知识和实战技巧。通过本书的学习，你将能够并将其应用到实际项目中，开发出优秀的iOS应用。

### 前言

“优雅”，这是对一个编程工作者的极高赞誉，而这也是我对SwiftUI最直观的感受。

4年前，在2019年全球开发者大会（WWDC）大会上，Apple正式向全世界推出了全新的现代化开发框架——SwiftUI。也是从那一年，我正式接触和自学编程。

有时候，我挺庆幸选择了从SwiftUI开始学起，其近似乎“聊天”的声明式语言特征，对非研发出身但对编程充满渴望的初学者非常友好。开发者只需要在脑海中构想UI界面的布局及其元素并告知SwiftUI，SwiftUI便可自动地且非常优雅地处理UI渲染和更新。甚至于，你可以只使用SwiftUI提供的一系列组件，如文字、图片、列表、表单等，通过简单的排列组合，就可以非常轻松地构建出复杂的用户界面。

学习一门编程语言，可能对很多人来说是一件非常枯燥的一件事情，你需要了解它的语言特点、底层代码逻辑、数据绑定和共享、生命周期管理等，但SwiftUI似乎有一种独特的魅力，它很好地将这些复杂的内容融入到一种直观且富有创造性的开发体验中，让开发者更加专注于产品的交互和逻辑设计上。

SwiftUI的设计目标是简化用户界面开发流程，提高开发效率，并在不同的环境里实现更高程度的代码共享。正是由于SwiftUI的种种优点，使得我从编程新手到能够独立开发并上架应用，最终成为了一名iOS独立开发者。

随着SwiftUI不断的发展演进，如今已成为苹果各款产品中主要的用户界面开发框架。

无论是iOS 14推出的桌面小组件，还是iOS 16上的锁屏小组件，甚至是在WWDC 2023中推出的全新空间计算设备Apple Vision Pro及搭建的空间操作系统visionOS，其开发都离不开SwiftUI的支持。

回顾学习SwiftUI的整个过程，我曾在互联网上寻找大量相关的教程和教材，然而却难以找到一本令人满意的体系化图书，这也使我在学习过程中倍感艰辛。

为了能快速地整理和学习SwiftUI知识，我尝试在技术论坛上发布一系列入门与实战相关的原创文章。随着时间的推移和发表文章数量的增加，我竟然也不知不觉走上了技术写作的道路。

本书并没有按照每个核心要点单独讲解，而是从实际案例出发，将SwiftUI的使用场景进行串联，成体系化地讲解和分享。

我希望你能在完成每一个案例之后感受到激动和喜悦，正如我刚开始学习SwiftUI一样，并维持着这份心情，去创造出属于自己的作品。

### 本书组织架构

本书分为14个章节，下面是各章的主要内容。

第1章详细介绍了Swift和SwiftUI的关系、开发软硬件要求和项目文件介绍等内容。通过这一章节的学习，你将了解SwiftUI在编程过程中的特性，掌握项目搭建的基础技能。

第2章讲解了如何使用SwiftUI快速完成一个简单的案例，并介绍了SwiftUI中常见组件的使用方法。通过这一章节的学习，你将具备快速使用内置组件快速搭建用户界面的能力。

第3章～第8章讲解了SwiftUI开发中的基础知识，包含动画、视图布局、代码块整理等基础知识，并通过2个项目案例练习，让你切身感受开发应用开发流程和SwiftUI原生开发的魅力。

第9章～第13章讲解项目开发中的核心功能，包含参数存储、项目架构设计、硬件设备调用、数据持久化存储等核心内容。让你的应用不仅仅只是静态的界面堆积，而是一款真正能够交互使用的精美应用。

第14章将通过一个实战案例巩固本书设计到的SwiftUI知识，并结合实际项目流程，开发一款可上架运营的应用。

### 读者对象

本书可以作为初级iOS开发人员的进阶读物，在介绍SwiftUI声明式语法风格的同时，将从实际案例出发讲解如何使用SwiftUI快速开发iOS应用。

### 勘误和反馈

书中难免会有一些错误或者不清晰的地方，在请读者们见谅的同时，也欢迎给予指正和反馈。书籍中的所有案例都可以从[GitHub](https://github.com/RicardoWesleyli/SwiftUIDeveloper.git)中下载，如果你有任何宝贵的想法和建议，也可以直接发送邮件至16620164429@163.com，期待与你的相遇。

### 作者简介
李智威，iOS独立开发者，高级产品经理，稀土掘金技术社区签约作者，华为鸿蒙KOL。拥有6年B端Saas产品经验，从0到1负责过国内Top3上市企业数智化项目的产品规划工作。独立开发并上架“不言笔记”“Linkcard”等应用，出版过《SwiftUI完全开发》等图书。曾获我爱黑“可颂” AI Hackathon大语言模型应用创新挑战赛 优胜奖。

### 致谢

感谢一直支持着我的江佩琦小姐，你的李智威先生已经写完了这本书啦～

感谢人民邮电出版社的编辑傅道坤老师、单瑞婷老师，在我写作的过程中给予的鼓励和帮助，让我能顺利完成全部书稿。

最后感谢我的父母、琦琦的父母，还有我那准备步入职场的妹妹，以及在我人生道路上指引我的张勇老师、曾璐思老师、叶泳成老师、许治老师，感谢你们对我的支持和帮助，为我照亮未来的路。

谨以此书献给我最亲爱的家人，以及众多热爱iOS的朋友们！

