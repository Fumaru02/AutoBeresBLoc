import 'package:bloc_flutter/pages/register/bloc/register_blocs.dart';
import 'package:bloc_flutter/pages/register/bloc/register_event.dart';
import 'package:bloc_flutter/pages/register/bloc/register_states.dart';
import 'package:bloc_flutter/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/values/colors.dart';
import '../sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
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
                      margin: EdgeInsets.only(top: 10.h),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/icons/bigIcon.png"))),
                      width: 205.w,
                      height: 175.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(child: _reusableText("Start your journey")),
                    Container(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _reusableText("Username"),
                          buildTextField("Enter your username", "name", "user",
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(UserNameEvent(value));
                          }),
                          _reusableText("Email"),
                          buildTextField(
                              "Enter your email address", "email", "email",
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(EmailEvent(value));
                          }),
                          _reusableText("Password"),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(PasswordEvent(value));
                          }),
                          _reusableText("Re-enter your password"),
                          buildTextField(
                              "Confirm your password", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(RePasswordEvent(value));
                          }),
                          Container(
                            margin: EdgeInsets.only(left: 5.w),
                            child: _reusableText(
                                "By creating an account you have to agree with our term & condition.",
                                fontSize: 14),
                          ),
                          buildLogAndRegButton("Sign Up", "login", () {
                            // Navigator.of(context).pushNamed("register");
                            RegisterController(context: context)
                                .handleEmailRegister();
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
    });
  }
}

Widget _reusableText(String text,
    {double fontSize = 16, Color colorDef = Colors.white}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: colorDef, fontWeight: FontWeight.w600, fontSize: fontSize),
    ),
  );
}
