import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:github_api_portfolio/views/tabs/favorite_page.dart';
import 'package:github_api_portfolio/views/tabs/profile_page.dart';
import 'package:github_api_portfolio/views/tabs/search_page.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white70,
        color: const Color(0xffc8e6c9),
        animationDuration: const Duration(milliseconds: 300),
        key: _bottomNavigationKey,
        items: const [
          Icon(
            Icons.person,
            color: Colors.grey,
          ),
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          Icon(
            Icons.favorite,
            color: Colors.grey,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: getBody(_page),
    );
  }
}

Widget getBody(int index) {
  switch (index) {
    case 0:
      return const ProfileWidget();
    case 1:
      return const SearchWidget();
    case 2:
      return const FavoriteWidget();
    default:
      return const ProfileWidget();
  }
}
