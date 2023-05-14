import 'package:bloc_flutter/pages/features_page/modul/data/dummy_data.dart';
import 'package:bloc_flutter/pages/features_page/modul/model/category.dart';
import 'package:bloc_flutter/pages/features_page/modul/screens/car_model_screen.dart';
import 'package:bloc_flutter/pages/features_page/modul/widgets/category_grid_item.dart';
import 'package:bloc_flutter/pages/home/widgets/reusable_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/base_text_widgets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectedCategory(BuildContext context, Category category) {
    final filteredCar = dummyCar
        .where((carmodels) => carmodels.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          CarParts(title: category.title, carmodels: filteredCar),
    ));
  }

  @override
  Widget build(BuildContext context) {
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
              margin: const EdgeInsets.only(bottom: 20),
              child: reusableTextGlobal("Module", color: Colors.white)),
        ),
        body: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectedCategory: () {
                  _selectedCategory(context, category);
                },
              )
          ],
        ),
      ),
    );
  }
}
