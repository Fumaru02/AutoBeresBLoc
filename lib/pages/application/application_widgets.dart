import 'package:bloc_flutter/pages/home/screen/home_page.dart';
import 'package:bloc_flutter/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import '../home/features_page/screen/features_page.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    const ModulePage(),
    const ProfilePage(),
  ];

  return widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
      label: "home",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/home.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/home.png",
          color: Colors.white,
        ),
      )),
  BottomNavigationBarItem(
      label: "modules",
      icon: SizedBox(
        width: 29.w,
        height: 29.h,
        child: Image.asset(
          "assets/icons/modules.png",
          color: Colors.grey,
        ),
      ),
      activeIcon: SizedBox(
        width: 29.w,
        height: 29.h,
        child: Image.asset(
          "assets/icons/modules.png",
          color: Colors.white,
        ),
      )),
  BottomNavigationBarItem(
      label: "profile",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/person2.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/person2.png",
          color: Colors.white,
        ),
      ))
];
