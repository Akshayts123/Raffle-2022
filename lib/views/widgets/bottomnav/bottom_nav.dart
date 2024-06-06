import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:floating_frosted_bottom_bar/floating_frosted_bottom_bar.dart';
import 'package:flutter/rendering.dart';

import '../../pages/Coupens/coupens.dart';
import '../../pages/Deals/catogories.dart';
import '../../pages/home/home_screen.dart';
import '../../pages/job_portal/job_home.dart';
import '../../pages/services/service_home.dart';
import 'nav1.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  late ScrollController _scrollController;
  bool _showBottomNavigationBar = true;
  final List<Color> colors = [
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }
  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_showBottomNavigationBar) {
        setState(() {
          _showBottomNavigationBar = false;
        });
      }
    } else {
      if (!_showBottomNavigationBar) {
        setState(() {
          _showBottomNavigationBar = true;
        });
      }
    }
  }
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  // final screens = [
  //   HomeScreen(),
  //   Catogories(),
  //   ScrachCoupens(),
  //   // OffersScreen(),
  //   JobHome(),
  //   ServicePage(),
  //
  // ];
  @override
  Widget build(BuildContext context) {
    return _showBottomNavigationBar ? FrostedBottomBar(
      opacity: 0.8,
      sigmaX: 2,
      sigmaY: 2,
      child: TabBar(
        padding: EdgeInsets.symmetric(horizontal: 0),
        indicatorColor: Theme.of(context).primaryColor,
        indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
        controller: tabController,
        indicator:  UnderlineTabIndicator(
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 4),
          insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
        ),
        tabs: [
          TabsIcon(
              icons: Icons.home,
              color: currentPage == 0 ? colors[0] : Colors.white),
          TabsIcon(
              icons: Icons.search,
              color: currentPage == 1 ? colors[1] : Colors.white),
          TabsIcon(
              icons: Icons.queue_play_next,
              color: currentPage == 2 ? colors[2] : Colors.white),
          TabsIcon(
              icons: Icons.file_download,
              color: currentPage == 3 ? colors[3] : Colors.white),
          TabsIcon(
              icons: Icons.menu,
              color: currentPage == 4 ? colors[4] : Colors.white),
        ],
      ),
      borderRadius: BorderRadius.circular(500),
      duration: const Duration(milliseconds: 800),
      hideOnScroll: true,
      body: (context, controller) => TabBarView(
        controller: tabController,
        dragStartBehavior: DragStartBehavior.down,
        physics: const BouncingScrollPhysics(),
        children: colors
            .map(
              (e) => GridView.builder(
                controller: _scrollController,
                itemCount: 1,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                // padding: EdgeInsets.only(left: appPadding),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 10 / 20,
                  crossAxisCount: 1,
                  // mainAxisSpacing: appPadding,
                  crossAxisSpacing: 0,
                ),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: screens[currentPage],
                  );
                },
              ),
            )
            .toList(),
      ),
    ):Container();
  }
}

final List<Widget> screens = <Widget>[
  HomeScreen(),
  Catogories(),
  ScrachCoupens(),
  // OffersScreen(),
  JobHome(),
  InfiniteNav(
    title: '',
  ),
  // ServicePage(),
];

class TabsIcon extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final IconData icons;

  const TabsIcon(
      {Key? key,
      this.color = Colors.white,
      this.height = 60,
      this.width = 50,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icons,
          color: color,
        ),
      ),
    );
  }
}
