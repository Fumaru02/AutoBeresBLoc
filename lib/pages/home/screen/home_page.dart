import 'dart:io';

import 'package:bloc_flutter/common/entities/chat.dart';
import 'package:bloc_flutter/common/values/colors.dart';
import 'package:bloc_flutter/pages/home/bloc/home_page_bloc.dart';
import 'package:bloc_flutter/pages/home/bloc/home_page_states.dart';
import 'package:bloc_flutter/pages/home/home_page_controller.dart';
import 'package:bloc_flutter/pages/home/screen/chat.dart';
import 'package:bloc_flutter/pages/home/widgets/home_page_widgets.dart';
import 'package:bloc_flutter/pages/home/widgets/reusable_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedImagePath = '';
  String imageURL = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: reusableBackground(),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(),
          drawerScrimColor: Colors.transparent,
          drawer: _drawerLeftSide(context),
          body: BlocBuilder<HomePageBloc, HomePageStates>(
              builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: homePageText("Hello",
                        color: AppColors.primaryThirdElementText),
                  ),
                  SliverToBoxAdapter(
                      child: homePageText("Fadilah Umar", top: 5)),
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20.h),
                  ),
                  SliverToBoxAdapter(child: searchView()),
                  SliverToBoxAdapter(child: slidersView(context, state)),
                  SliverToBoxAdapter(child: menuView()),
                  SliverPadding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(childCount: 4,
                            (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {}, child: courseGrid());
                        }),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                childAspectRatio: 1.6),
                      ))
                ],
              ),
            );
          })),
    );
  }

  Widget _drawerLeftSide(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      child: SizedBox(
        width: 248,
        child: Drawer(
          child: Stack(children: [
            Container(
              foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Colors.black.withOpacity(0.95),
                    const Color(0xff2D2D2D),
                    const Color(0xff2D2D2D),
                    const Color(0xff242424).withOpacity(1),
                  ])),
            ),
            ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: selectedImagePath == ''
                            ? Image.asset(
                                'assets/icons/img.png',
                                height: 100.h,
                                width: 100.w,
                                fit: BoxFit.fill,
                              )
                            : Image.file(
                                File(selectedImagePath),
                                height: 100.h,
                                width: 100.w,
                                fit: BoxFit.fill,
                              ),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          selectImage();
                          setState(() {});
                        },
                        label: const Text(
                          'Add Image',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: const Icon(Icons.edit_outlined),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Fadilah Umar",
                        style: TextStyle(
                            fontFamily: 'DeliciousHandrawn',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      const Text(
                        "fumaruemail@gmail.com",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: const Text(
                    ' Profile ',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.car_crash, color: Colors.white),
                  title: const Text(
                    ' Vehicle ',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  title: const Text(' Chat ',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChatRoom(),
                    ));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.group,
                    color: Colors.white,
                  ),
                  title: const Text(' Groups ',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.forum,
                    color: Colors.white,
                  ),
                  title: const Text(' Forum ',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  title: const Text(' About ',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: const Text('LogOut',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future selectImage() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.h)),
          child: SizedBox(
            height: 200.h,
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: Column(
                children: [
                  Text(
                    'Select Image From :',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          selectedImagePath = await selectedImageFromGallery();
                          if (selectedImagePath != '') {
                            Navigator.pop(context);
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No image selected !'),
                              ),
                            );
                          }
                        },
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/gallery.png',
                                  height: 60.h,
                                  width: 60.w,
                                ),
                                const Text('Gallery')
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HomePageController(context: context)
                              .handleImagePickerWithCamera();
                        },
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/photo.png',
                                  height: 60.h,
                                  width: 60.w,
                                ),
                                const Text('Camera')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  selectedImageFromGallery() async {
    XFile? file = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 150.w);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
