import 'package:bloc_flutter/pages/home/features_page/modul/models/car_model.dart';
import 'package:bloc_flutter/pages/home/widgets/reusable_background.dart';
import 'package:bloc_flutter/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/base_text_widgets.dart';

class SparePartsDetail extends StatelessWidget {
  const SparePartsDetail({super.key, required this.carmodel});

  final CarModel carmodel;

  void fetchDataDetails() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: reusableBackground(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 40.h,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black.withOpacity(0.9),
          centerTitle: true,
          title: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: reusableTextGlobal(carmodel.title, color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  carmodel.imageUrl,
                  height: 300.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              reusableText('Description:',
                  fontSize: 22, colorDef: Colors.black),
              for (final description in carmodel.description)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 22),
                  ),
                ),
              reusableText('Details:', fontSize: 22, colorDef: Colors.black),
              for (final details in carmodel.details)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    details,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 22),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
