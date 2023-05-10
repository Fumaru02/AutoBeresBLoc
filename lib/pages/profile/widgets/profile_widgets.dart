import 'package:bloc_flutter/common/routes/names.dart';
import 'package:bloc_flutter/common/values/colors.dart';
import 'package:bloc_flutter/pages/widgets/base_text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black.withOpacity(0.9),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset("assets/icons/menu.png"),
        ),
        reusableTextGlobal("Profile", color: Colors.white),
        IconButton(
            onPressed: () => showBottomSheet(
                  context: context,
                  builder: (context) => const Text("data"),
                ),
            icon: const Icon(Icons.add))
      ],
    ),
  );
}

//profile icon and edit button
Widget profileIconAndEditButton() {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 100.w,
    height: 100.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.w),
        image: const DecorationImage(
            image: AssetImage("assets/icons/fumaru.png"))),
    child: Image(
        width: 25.w,
        height: 25.h,
        image: const AssetImage("assets/icons/edit_3.png")),
  );
}

//setting sections buttons

// var imageInfo = <String, String>{
//   "Settings": "settings.png",
//   "Payment details": "credit-card.png",
//   "Achievement": "award.png",
//   "Love": "heart(1).png",
//   "Reminders": "cube.png",
// };

// Widget buildListView(BuildContext context) {
//   return Column(
//     children: [
//       ...List.generate(
//           imageInfo.length,
//           (index) => GestureDetector(
//                 onTap: () =>
//                     Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
//                 child: Container(
//                   margin: EdgeInsets.only(bottom: 15.h),
//                   child: Row(children: [
//                     Container(
//                       width: 40.w,
//                       height: 40.h,
//                       padding: const EdgeInsets.all(7.0),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.w),
//                           color: AppColors.primaryElement),
//                       child: Image.asset(
//                           "assets/icons/${imageInfo.values.elementAt(index)}"),
//                     ),
//                     SizedBox(
//                       width: 15.w,
//                     ),
//                     Text(
//                       imageInfo.keys.elementAt(index),
//                       style: TextStyle(
//                           color: AppColors.primaryText,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16.sp),
//                     ),
//                   ]),
//                 ),
//               ))
//     ],
//   );
// }