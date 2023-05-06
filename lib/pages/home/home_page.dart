import 'package:bloc_flutter/common/values/colors.dart';
import 'package:bloc_flutter/pages/home/bloc/home_page_blocs.dart';
import 'package:bloc_flutter/pages/home/bloc/home_page_states.dart';
import 'package:bloc_flutter/pages/home/widgets/home_page_widgets.dart';
import 'package:bloc_flutter/pages/home/widgets/reusable_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: reusableBackground(),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(),
          drawerScrimColor: Colors.transparent,
          drawer: _drawerLeftSide(context),
          body: BlocBuilder<HomePageBlocs, HomePageStates>(
              builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: homePageText("Hello",
                        color: AppColors.primaryThirdElementText),
                  ),
                  SliverToBoxAdapter(
                      child: homePageText("Fadilah Umar", top: 5)),
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20.h),
                  ),
                  SliverToBoxAdapter(child: searchView()),
                  SliverToBoxAdapter(child: slidersView(context, state)),
                  SliverToBoxAdapter(child: menuView()),
                  SliverPadding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(childCount: 4,
                            (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {}, child: courseGrid());
                        }),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                childAspectRatio: 1.6),
                      ))
                ],
              ),
            );
          })),
    );
  }

  Widget _drawerLeftSide(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      child: SizedBox(
        width: 248,
        child: Drawer(
          child: Stack(children: [
            Container(
              foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Colors.black.withOpacity(0.95),
                    const Color(0xff2D2D2D),
                    const Color(0xff2D2D2D),
                    const Color(0xff242424).withOpacity(1),
                  ])),
            ),
            ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 72,
                        backgroundImage: AssetImage("assets/icons/fumaru.png"),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Fadilah Umar",
                        style: TextStyle(
                            fontFamily: 'DeliciousHandrawn',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Text(
                        "fumaruemail@gmail.com",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: const Text(
                    ' Profile ',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.car_crash, color: Colors.white),
                  title: const Text(
                    ' Vehicle ',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  title: const Text(' Chat ',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.group,
                    color: Colors.white,
                  ),
                  title: const Text(' Groups ',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.forum,
                    color: Colors.white,
                  ),
                  title: const Text(' Forum ',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  title: const Text(' About ',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: const Text('LogOut',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
