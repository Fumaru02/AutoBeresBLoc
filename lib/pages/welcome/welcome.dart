import 'package:bloc_flutter/common/values/colors.dart';
import 'package:bloc_flutter/common/values/constant.dart';
import 'package:bloc_flutter/pages/welcome/bloc/welcome_blocs.dart';
import 'package:bloc_flutter/pages/welcome/bloc/welcome_events.dart';
import 'package:bloc_flutter/pages/welcome/bloc/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              color: AutoBeresColors.primaryBackgroundColor,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/Autoberesbackground.png"))),
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(right: 260.w, top: 20.h),
                width: 86.w,
                height: 86.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/autoberes.png"),
                  ),
                ),
              ),
              PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                },
                children: [
                  _page(
                      1,
                      context,
                      "Next",
                      "Where vehicle",
                      "maintenance meets convenience",
                      "assets/images/autoberesw1.png"),
                  _page(2, context, "Next", "The ultimate vehicle",
                      "care solution", "assets/images/autoberesw2.png"),
                  _page(3, context, "Get Started", "Drive worry-free ",
                      "with our app", "assets/images/autoberesw3.png"),
                ],
              ),
              Positioned(
                  bottom: 60.h,
                  child: DotsIndicator(
                    position: state.page.toDouble(),
                    dotsCount: 3,
                    decorator: DotsDecorator(
                        color: AppColors.primaryThirdElementText,
                        activeColor: AutoBeresColors.primaryColor,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    mainAxisAlignment: MainAxisAlignment.center,
                  ))
            ],
          ),
        );
      },
    ));
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 325.w,
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AutoBeresColors.primaryColor,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            )),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              //jump to a new page
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => MyHomePage(title: title),
              // ));
              // Global.storageService
              //     .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/sign_in", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 75.h, left: 25.w, right: 25.w),
            width: 212.w,
            height: 57.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.w)),
                color: AutoBeresColors.primaryColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
