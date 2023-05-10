import 'package:bloc_flutter/common/values/colors.dart';
import 'package:bloc_flutter/pages/home/widgets/home_page_widgets.dart';
import 'package:bloc_flutter/pages/home/widgets/reusable_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/base_text_widgets.dart';

class Modul extends StatelessWidget {
  const Modul({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: reusableBackground(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 80.h,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black.withOpacity(0.9),
          centerTitle: true,
          title: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: reusableTextGlobal("Module", color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              reusableContainerPage(
                  //title
                  "Body Parts",
                  //image
                  "assets/images/bodyparts.png",
                  //description
                  "Bodi adalah bagian dari kendaraan yang dibentuk sedemikian rupa, (pada umumnya) terbuat dari bahan plat logam (stell plate) yang tebalnya.."),
              reusableContainerPage(
                  //title
                  "Engine Parts",
                  //image
                  "assets/images/engineparts.png",
                  //description
                  "sebuah singkatan untuk Electronic Control Unit atau Unit kontrol elektronik yang berfungsi untuk melakukan optimasi..."),
            ],
          ),
        ),
      ),
    );
  }

  Widget reusableContainerPage(
    String title,
    String imagePath,
    String description,
  ) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, top: 20.h),
      width: 354.w,
      height: 105.h,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          SizedBox(
            width: 50.w,
            height: 69.h,
            child: Image.asset(
              imagePath,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              reusableTextGlobal(title, color: Colors.black),
              Container(
                margin: EdgeInsets.only(top: 6.h),
                width: 230.w,
                height: 57.h,
                child: reusableTextGlobal(description,
                    fontSize: 10, color: AutoBeresColors.greytransTextColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
