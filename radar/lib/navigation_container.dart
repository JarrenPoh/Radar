import 'package:flutter/material.dart';
import 'package:radar/pages/add_post_page.dart';
import 'package:radar/pages/home_page.dart';
import 'package:radar/pages/inbox_page.dart';
import 'package:radar/pages/profile_page.dart';
import 'package:radar/pages/search_page.dart';
import 'package:radar/widgets/custom_bottom_navigation_bar.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedPageIndex = 0;
  static const List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    AddPostPage(),
    InboxPage(),
    ProfilePage(),
  ];

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedPageIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onIconTap: _onIconTapped,
        selectedPageIndex: _selectedPageIndex,
      ),
    );
  }
}
