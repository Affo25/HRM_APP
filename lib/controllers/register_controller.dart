import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hrm_system/model/register_model.dart';
import 'package:image_picker/image_picker.dart';

import '../model/globals.dart';
import '../routes/routes.dart';
import '../services/database_service.dart';

class RegisterController extends GetxController{
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  final dbService = DatabaseService();

  var items = [
    'Admin',
    'User',
  ];

  String option = "";
  String file = "";

  File? pickedImage;

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImages != null) {
        file = pickedImages.path;
        update();
    }
  }
  void getValues(String val){
    option = val;
    update();
  }

  void gotoLogin() {
    Get.toNamed(AppRoutes.login);
    update();
  }

  void userRegistrtion(BuildContext context) async {
    if (passCtrl.text == "" || emailCtrl.text.isEmpty) {
      Get.snackbar("ERROR", "Please enter all fields....");
      return;
    }

    RegisterModel d = RegisterModel(0, nameCtrl.text, emailCtrl.text, phoneCtrl.text, passCtrl.text,option,file);
    var response = await dbService.registerUser(d);
    if (response.status == "ERROR") {
      print("Error saving Expense");
      AnimatedSnackBar.material(
          ' User Register  ${response.message}',
          type: AnimatedSnackBarType.error,
          duration: Duration(seconds: 3)
      ).show(
        context,
      );
      return;
    } else {
      AnimatedSnackBar.material(
          ' Register ${response.message}',
          type: AnimatedSnackBarType.success,
          duration: Duration(seconds: 3)
      ).show(
        context,
      );
    }
    nameCtrl.text="";
    passCtrl.text="";
    emailCtrl.text="";
    file="";
    phoneCtrl.text="";
     Globals.currentID = response.data[0].id;
    print(Globals.currentID);
    Get.toNamed(AppRoutes.login);
  }
}