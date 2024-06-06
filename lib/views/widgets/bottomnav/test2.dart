import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class limesoda extends HookWidget {
  final int _initialIndex = 0;
  final List<Widget> _screens = [    HomePage(),    SettingsPage(),    ProfilePage(),  ];
  final double _navBarHeight = 56.0;
  final double _bottomPadding = 16.0;
  final Duration _animationDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final _selectedIndex = useState(_initialIndex);
    final _scrollController = useScrollController();
    final _isNavBarVisible = useState(true);

    void _handleScroll() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        _isNavBarVisible.value = false;
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        _isNavBarVisible.value = true;
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(height: 16.0),
            ..._screens,
            SizedBox(height: _bottomPadding),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: _animationDuration,
        height: _isNavBarVisible.value ? _navBarHeight : 0.0,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          onTap: (index) {
            _selectedIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      color: Colors.red,
      child: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      color: Colors.blue,
      child: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      color: Colors.green,
      child: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}

