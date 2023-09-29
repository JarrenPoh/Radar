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

class _NavigationContainerState extends State<NavigationContainer>
    with AutomaticKeepAliveClientMixin {
  @override
  final bool wantKeepAlive = true;
  int _selectedPageIndex = 0;
  static const List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    AddPostPage(),
    InboxPage(),
    ProfilePage(),
  ];
  final PageController _pageController = PageController();

  void _onIconTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onIconTap: _onIconTapped,
        selectedPageIndex: _selectedPageIndex,
      ),
    );
  }
}
