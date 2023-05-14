import 'package:bloc_flutter/pages/features_page/modul/model/car_model.dart';
import 'package:bloc_flutter/pages/home/widgets/reusable_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/base_text_widgets.dart';
import '../widgets/car_item.dart';

class CarParts extends StatelessWidget {
  const CarParts({super.key, required this.title, required this.carmodels});

  final String title;
  final List<CarModel> carmodels;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('uh oh... nothing here!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 16,
          ),
          Text(
            'Try selectiong a different category!',
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );

    if (carmodels.isNotEmpty) {
      content = ListView.builder(
          itemCount: carmodels.length,
          itemBuilder: (context, index) => CarItem(
                carmodel: carmodels[index],
              ));
    }

    return Container(
      decoration: reusableBackground(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 50.h,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black.withOpacity(0.9),
          centerTitle: true,
          title: Container(
              margin: const EdgeInsets.only(bottom: 0),
              child: reusableTextGlobal(title, color: Colors.white)),
        ),
        body: content,
      ),
    );
  }
}
