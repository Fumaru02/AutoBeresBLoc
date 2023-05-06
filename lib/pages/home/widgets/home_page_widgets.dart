import 'package:bloc_flutter/common/values/colors.dart';
import 'package:bloc_flutter/pages/home/bloc/home_page_blocs.dart';
import 'package:bloc_flutter/pages/home/bloc/home_page_events.dart';
import 'package:bloc_flutter/pages/home/bloc/home_page_states.dart';
import 'package:bloc_flutter/pages/widgets/base_text_widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    //drawer icon
    leading: Builder(
      builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          )),
    ),
    backgroundColor: Colors.black.withOpacity(0.9),
    title: Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_titleHome(), _avatarUser()]),
    ),
  );
}

Widget _avatarUser() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40.w,
      height: 40.h,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(image: AssetImage("assets/icons/fumaru.png"))),
    ),
  );
}

Widget _titleHome() {
  return RichText(
    text: const TextSpan(children: [
      TextSpan(
          text: "A U T O",
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
      TextSpan(
          text: " B E R E S",
          style: TextStyle(
              color: AutoBeresColors.primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.bold))
    ]),
  );
}

//reusable bigText widget
Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            SizedBox(
                width: 240.w,
                height: 40.h,
                child: TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                        hintText: "search your course",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        hintStyle: TextStyle(
                            color: AppColors.primarySecondaryElementText)),
                    style: TextStyle(
                        color: AppColors.primaryText,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp),
                    autocorrect: false,
                    obscureText: false)),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(left: 2),
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AutoBeresColors.primaryColor,
            border: Border.all(color: Colors.black, width: 2.w),
            borderRadius: BorderRadius.all(
              Radius.circular(13.w),
            ),
          ),
          child: Image.asset(
            "assets/icons/options.png",
            color: Colors.black,
          ),
        ),
      )
    ],
  );
}

//for sliders

Widget slidersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(path: "assets/images/mechanic-fix.jpg"),
            _slidersContainer(path: "assets/images/car-accessories.jpg"),
            _slidersContainer(path: "assets/images/mechanic-work.jpg"),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index.toDouble(),
        decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
      )
    ],
  );
}

//sliders widget

Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}

// Menu view for showing items

Widget menuView() {
  return Column(
    children: [
      Container(
          width: 325.w,
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              reusableTextGlobal("Choose your journal"),
              GestureDetector(
                child: reusableTextGlobal("See all",
                    color: AppColors.primaryThirdElementText, fontSize: 10),
              )
            ],
          )),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular",
                textColor: AppColors.primaryThirdElementText,
                backgroundColor: Colors.white),
            _reusableMenuText("Newest",
                textColor: AppColors.primaryThirdElementText,
                backgroundColor: Colors.white),
          ],
        ),
      )
    ],
  );
}

//for the menu buttons, reusable text
Widget _reusableMenuText(String menuText,
    {Color textColor: AutoBeresColors.primaryBackgroundColor,
    Color backgroundColor: AutoBeresColors.primaryColor}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backgroundColor)),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    child: reusableTextGlobal(menuText,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 11),
  );
}

//for course grid view ui
Widget courseGrid() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/mechanic-work.jpg"))),
    child: Container(
      padding: EdgeInsets.all(12.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AutoBeresColors.primaryBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Best WorkShop",
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.left,
                  softWrap: false,
                  style: TextStyle(
                      color: AutoBeresColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Experienced Mechanic",
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.left,
                  softWrap: false,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 8.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
