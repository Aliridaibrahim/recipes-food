
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/colors.dart';
import '../utils/globalvariable.dart';


class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    // Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: const Color(0xff333033),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
          "assets/images/home.svg",
              color: (_page == 0) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/camera.svg",
              color: (_page == 2) ? primaryColor : secondaryColor,
              // You can adjust width and height as needed
              width: 24,
              height: 24,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/add.svg",
              color: (_page == 3) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/list.svg",
              color: (_page == 4) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/user.svg",
              color: (_page == 5) ? primaryColor : secondaryColor,
            ),
            label: '',
            backgroundColor: primaryColor,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}