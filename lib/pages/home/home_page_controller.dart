import 'dart:io';

import 'package:bloc_flutter/pages/home/bloc/home_page_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class HomePageController {
  final BuildContext context;
  const HomePageController({required this.context});

  Future<void> handleImagePickerWithCamera() async {
    final state = context.read<HomePageBloc>().state;
    String imageURL = state.imageURL;
    String selectedImagePath = state.selectedImagePath;

    selectedImageFromCamera() async {
      XFile? file = await ImagePicker().pickImage(
          source: ImageSource.camera, imageQuality: 50, maxWidth: 150.w);

      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImage = referenceRoot.child('images');
      Reference referenceImageToUpload =
          referenceDirImage.child(uniqueFileName);
      referenceImageToUpload.putFile(File(file!.path));

      try {
        await referenceImageToUpload.putFile(File(file.path));
        imageURL = await referenceImageToUpload.getDownloadURL();

        final user = FirebaseAuth.instance.currentUser!;
        FirebaseFirestore.instance.collection('users').doc(user.uid).update({
          'image_url': imageURL,
        });
      } catch (error) {
        //catch error
      }
      if (file != null) {
        return file.path;
      } else {
        return '';
      }
    }

    if (selectedImagePath == '') {
      Navigator.pop(context);
      selectedImagePath = await selectedImageFromCamera();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No image selected !'),
        ),
      );
    }
  }
}
