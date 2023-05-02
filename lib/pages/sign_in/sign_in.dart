import 'package:bloc_flutter/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:bloc_flutter/pages/sign_in/bloc/sign_in_events.dart';
import 'package:bloc_flutter/pages/sign_in/bloc/sign_in_states.dart';
import 'package:bloc_flutter/pages/sign_in/sign_in_controller.dart';
import 'package:bloc_flutter/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            top: true,
            child: Container(
              decoration: const BoxDecoration(
                  color: AutoBeresColors.primaryBackgroundColor,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          AssetImage("assets/images/Autoberesbackground.png"))),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/icons/bigIcon.png"))),
                        width: 205.w,
                        height: 175.h,
                      ),
                      reusableText("Let's Get Started"),
                      reusableText(
                          "Ride with ease and convenience by \nusing our vehicle service app!",
                          fontSize: 16,
                          colorDef: Colors.white),
                      Container(
                        margin: EdgeInsets.only(top: 36.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField(
                                "Enter your email address", "email", "email",
                                (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            }),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField(
                                "Enter your password", "password", "lock",
                                (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            }),
                            forgotPassword(),
                            buildThirdPartyLogin(context),
                            buildLogAndRegButton("Log In", "login", () {
                              SignInController(context: context)
                                  .handleSingIn("email");
                            }),
                            buildLogAndRegButton("Sign Up", "register", () {
                              Navigator.of(context).pushNamed("/register");
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
