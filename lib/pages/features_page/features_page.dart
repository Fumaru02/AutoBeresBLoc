import 'package:bloc_flutter/common/values/colors.dart';
import 'package:bloc_flutter/pages/features_page/modul/modultest.dart';
import 'package:bloc_flutter/pages/features_page/modul/screens/categories.dart';
import 'package:bloc_flutter/pages/home/widgets/home_page_widgets.dart';
import 'package:bloc_flutter/pages/home/widgets/reusable_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({super.key});

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: reusableBackground(),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(),
          body: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  crossAxisCount: 1,
                  children: <Widget>[
                    //lanjut bikin konstruktor
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoriesScreen(),
                          )),
                      child: _mainPage(
                          //background image
                          "assets/icons/mekanik2.png",
                          //icon
                          "assets/icons/module.png",
                          //Title
                          "Modules\n",
                          //Subtitle
                          "Materi belajar yang disusun secara sistematis \ndan terstruktur untuk membantu  memahami \ndasar-dasar perbaikan kendaraan."),
                    ),
                    InkWell(
                      onTap: () {},
                      child: _mainPage(
                          //background image
                          "assets/icons/mekanik1.png",
                          //icon
                          "assets/icons/reminder.png",
                          //Title
                          "Reminder\n",
                          //Subtitle
                          "Layanan pengingat untuk pemilik kendaraan \nuntuk melakukan servis secara teratur sesuai \ndengan jadwal yang direkomendasikan."),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

//Colum main page
  Widget _mainPage(
    String imagePath1,
    String imagePath2,
    String textTitle,
    String subTitle,
  ) {
    return Container(
      width: 300.w,
      height: 300.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                imagePath1,
              ),
              fit: BoxFit.fill),
          color: Colors.red,
          borderRadius: const BorderRadius.all(Radius.circular(40))),
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black,
                      Colors.white.withOpacity(0.1),
                    ])),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 12.w),
                      width: 26.w,
                      height: 32.h,
                      child: Image(image: AssetImage(imagePath2)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w, bottom: 16.h),
                      child: RichText(
                          text: TextSpan(
                              text: textTitle,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AutoBeresColors.primaryColor),
                              children: <TextSpan>[
                            TextSpan(
                              text: subTitle,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                          ])),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
