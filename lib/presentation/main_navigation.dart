import 'package:flutter/material.dart';
import 'package:news_app/common/constants/colors.dart';
import 'package:news_app/common/constants/images.dart';
import 'package:news_app/presentation/bookmark/bookmark_page.dart';
import 'package:news_app/presentation/home/home_page.dart';
import 'package:news_app/presentation/search/search_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const BookmarkPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: _navigationBar(),
    );
  }

  Widget _navigationBar() {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Image.asset(
            Images.iconHome,
            width: 24,
            height: 24,
          ),
          selectedIcon: Image.asset(
            Images.iconHomeSelected,
            width: 24,
            height: 24,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Image.asset(
            Images.iconSearch,
            width: 24,
            height: 24,
          ),
          selectedIcon: Image.asset(
            Images.iconSearchSelected,
            width: 24,
            height: 24,
          ),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Image.asset(
            Images.iconBookmark,
            width: 24,
            height: 24,
          ),
          selectedIcon: Image.asset(
            Images.iconBookmarkSelected,
            width: 24,
            height: 24,
          ),
          label: 'Bookmark',
        ),
      ],
      height: 60,
      elevation: 2,
      animationDuration: const Duration(seconds: 3),
      indicatorColor: Colors.transparent,
      backgroundColor: ColorsName.white,
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onItemTapped,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    );
  }
}
