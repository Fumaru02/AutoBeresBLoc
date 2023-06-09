import 'package:bloc_flutter/common/routes/pages.dart';
import 'package:bloc_flutter/common/values/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'common/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';

Future<void> main() async {
  //firebase integration
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of
  // application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
          //control screen mobile
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    appBarTheme: const AppBarTheme(
                        iconTheme: IconThemeData(color: AppColors.primaryText),
                        elevation: 0,
                        backgroundColor: Colors.white)),
                onGenerateRoute: AppPages.GenerateRouteSettings,
              )),
    );
  }
}
