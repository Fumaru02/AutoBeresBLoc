import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration reusableBackground() {
  return const BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/Autoberesbackground.png")));
}
