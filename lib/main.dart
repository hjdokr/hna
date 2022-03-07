import 'package:flutter/material.dart';
import '/pages/index.dart';
import '/styles/index.dart';
import '/utils/index.dart';
import '/widgets/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: const MyHomePage(title: '梦想加速器'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void onIndexChanged(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // 扩展到Scaffold的底部
      resizeToAvoidBottomInset: false, // 不允许键盘事件影响界面
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // PageController 控制 PageView 呈现页面
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onIndexChanged,
        children: const [
          DemoPage(title: "听"),
          DemoPage(title: "说"),
          DemoPage(title: "思"),
          DemoPage(title: "梦"),
        ],
      ),
      // 底部带凹下的导航
      bottomNavigationBar: BuildNavigation(
        currentIndex: currentIndex,
        items: [
          NavigationItemModel(
            label: "听",
            icon: SvgIcon.layout,
          ),
          NavigationItemModel(
            label: "说",
            icon: SvgIcon.marker,
          ),
          NavigationItemModel(
            label: "思",
            icon: SvgIcon.chat,
            count: 3,
          ),
          NavigationItemModel(
            label: "梦",
            icon: SvgIcon.user,
          ),
        ],
        onTap: onIndexChanged, // 切换tab事件
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_circle_rounded, size: 50),
      ), // 浮动按钮
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // 浮动按钮 停靠在底部中间位置
    );
  }
}
