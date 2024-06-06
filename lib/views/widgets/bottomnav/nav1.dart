
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../pages/Coupens/coupens.dart';
import '../../pages/Deals/catogories.dart';
import '../../pages/home/home_screen.dart';
import '../../pages/job_portal/job_home.dart';
import 'nav.dart';


class InfiniteNav extends StatefulWidget {
  InfiniteNav({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _InfiniteNavState createState() => _InfiniteNavState();
}

class _InfiniteNavState extends State<InfiniteNav>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.pink
  ];

  @override
  void initState() {
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

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomBar(

          currentPage: currentPage,
          tabController: tabController,
          colors: colors,
          unselectedColor: Colors.white,
          barColor: Colors.black,
          start: 10,
          end: 2,

          child: TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: colors.map((e) => GridView.builder(
              // controller: controller,
              itemCount: 1,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              // padding: EdgeInsets.only(left: appPadding),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 10 / 20.5,
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
            ),).toList(),
          ),
        ),
      ),
    );
  }
}
final  List<Widget> screens = <Widget> [
  HomeScreen(),
  Catogories(),
  ScrachCoupens(),
  // OffersScreen(),
  JobHome(),
  InfiniteNav(title: '',),
  // ServicePage(),

];
class InfiniteListPage extends HookWidget {
  final Color color;
   InfiniteListPage({required this.color, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final indexState = useState(0);
    final ScrollController controller =
        InheritedDataProvider.of(context).scrollController;
    return GridView.builder(
      controller: controller,
      itemCount: 1,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      // padding: EdgeInsets.only(left: appPadding),
      gridDelegate:
       SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 10 / 18,
        crossAxisCount: 1,
        // mainAxisSpacing: appPadding,
        crossAxisSpacing: 0,
      ),
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: (){},
          child:screens[indexState.value],
        );
      },
    );
  }
}