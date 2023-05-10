import 'package:bloc_flutter/common/values/colors.dart';
import 'package:bloc_flutter/pages/home/widgets/reusable_background.dart';
import 'package:bloc_flutter/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:bloc_flutter/pages/profile/settings/bloc/settings_events.dart';
import 'package:bloc_flutter/pages/profile/widgets/profile_widgets.dart';
import 'package:bloc_flutter/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: reusableBackground(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildAppbar(context),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                profileIconAndEditButton(),
                SizedBox(
                  height: 16.h,
                ),
                _profileInfo(),
                Container(
                  width: 340.w,
                  height: 340.h,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.8, 1),
                        colors: <Color>[
                          Color(0xff000000),
                          Color(0xff101010),
                          Color(0xff1b1b1b),
                          Color(0xff242424),
                          Color(0xff2f2f2f),
                          Color(0xff393939)
                        ],
                      )),
                  child: PageView(
                    onPageChanged: (value) {
                      context.read<SettingsBlocs>().add(TriggerSettings(value));
                    },
                    children: [
                      _vehicleDetails(1, context,
                          vehicleName: "Vario",
                          vehicleMerk: "Honda",
                          modelType: "Scooter",
                          octaneNumber: "RON 90",
                          plateNumber: "B 3636 FHY",
                          transmissionType: "Automatic",
                          vehicleColor: "White",
                          vehicleBirth: "2022",
                          path: "assets/images/vario.png"),
                      _vehicleDetails(2, context,
                          vehicleName: "BMW i Series",
                          vehicleMerk: "BMW",
                          modelType: "Sport",
                          octaneNumber: "RON 95",
                          plateNumber: "F 2 MAR",
                          transmissionType: "Automatic",
                          vehicleColor: "Grey(M)",
                          vehicleBirth: "2023",
                          path: "assets/images/bmw.png"),
                      _vehicleDetails(3, context),
                      //jadikan tombol berubah status ketika kondisi data sudah terisi
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonDetails() {
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              padding: EdgeInsets.symmetric(horizontal: 90.w, vertical: 5.h),
              backgroundColor: AutoBeresColors.primaryColor),
          onPressed: () {},
          child: reusableText("Details", fontSize: 20, colorDef: Colors.black)),
    );
  }

//vehicle data
  Widget _vehicleDetails(int index, BuildContext context,
      {String vehicleName = "Null",
      String vehicleMerk = "Merk?",
      String modelType = "Unknown",
      String octaneNumber = "Unknown",
      String transmissionType = "Unknown",
      String vehicleColor = "Unknown",
      String vehicleBirth = "Unknown",
      String plateNumber = "Unknown",
      String path = "assets/images/prototypeCar.png"}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        reusableText(
          vehicleName,
          fontSize: 20,
          top: 16,
          bottom: 0,
          colorDef: Colors.white,
        ),
        reusableText(vehicleMerk,
            fontSize: 14,
            top: 0,
            colorDef: AutoBeresColors.primaryColor,
            fontWeight: FontWeight.normal),
        SizedBox(
          width: 222.w,
          height: 138.h,
          child: Image.asset(
            path,
            fit: BoxFit.fill,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: 5.w, left: 16.w),
              height: 42.h,
              width: 80.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Model Type", fontSize: 12),
                  reusableText(modelType, fontSize: 16, colorDef: Colors.white),
                ],
              ),
            ),
            SizedBox(
              height: 42.h,
              width: 80.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Octane Number", fontSize: 12),
                  reusableText(octaneNumber,
                      fontSize: 16, colorDef: Colors.white),
                ],
              ),
            ),
            SizedBox(
              height: 42.h,
              width: 80.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Transmission", fontSize: 12),
                  reusableText(transmissionType,
                      fontSize: 16, colorDef: Colors.white),
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: 5.w, left: 16.w, top: 5.h),
              height: 42.h,
              width: 80.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Color", fontSize: 12),
                  reusableText(vehicleColor,
                      fontSize: 16, colorDef: Colors.white),
                ],
              ),
            ),
            SizedBox(
              height: 42.h,
              width: 80.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Year", fontSize: 12),
                  reusableText(vehicleBirth,
                      fontSize: 16, colorDef: Colors.white),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 0.w),
              height: 42.h,
              width: 80.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("Plate Number", fontSize: 12),
                  Text(
                    plateNumber,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        _buttonDetails()
      ],
    );
  }

  Widget _profileInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        reusableText("Fumaru", colorDef: Colors.black, fontSize: 22),
        reusableText("fumaruemail@gmail.com",
            colorDef: AutoBeresColors.greytransTextColor, fontSize: 16),
        reusableText("081249929929",
            colorDef: AutoBeresColors.greytransTextColor, fontSize: 16),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16.h),
          height: 30.h,
          width: 120.w,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: reusableText("My Collections",
              fontSize: 12, top: 8, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
