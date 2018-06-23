## OneBlog Based on Struts2

# 一个博客

@(框架)[Struts2|BootStrap3.0|JQuery1.9.0|Editor.md1.5.0|LiveRe|不蒜子]

@()[项目名称:[OneBlog](https://github.com/CS2015YWB/OneBlog)|开发者:[CS2015YWB](https://github.com/CS2015YWB) |时间:2018年6月]

## 安装启动方法
- `git clone git@github.com:CS2015YWB/OneBlog.git`
- 启动`Intellij IDEA`，`Open`，找到`OneBlog`目录，`OK`
- `Loading Project.....`
- 配置环境`Java 1.8.0`，`Apache TomCat 9.0.8`
- 数据库请使用`MySQL 5.7.1`以上版本，自行修改配置，见`blog.sql`
- `run! ( Shift+F10 )`

## 功能模块介绍
|  功能  |   Action业务控制器      |
|:-----:|:---------------------:|
| 首页显示文章模块|display.action|
| 注册|signup.action|
| 登录| signin.action|
| 退出|logout.action|
| 查看个人信息|myInfo.action|
| 保存修改个人信息| modifyInfo.action|
| 发表文章| edit.action|
|查看我的文章|myPost.action|
| 查看文章详细内容|fullText.action|
|修改时加载原文章|modify.action|
|保存修改后的文章|saveChange.action|
|删除文章|delete.action|
|模糊搜索相关文章|search.action|

 > Created By  [静水Lion](http://csyanwb.cn)

