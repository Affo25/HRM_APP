import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hrm_system/common/app_manager.dart';
import 'package:hrm_system/model/globals.dart';
import 'package:hrm_system/model/login.dart';
import 'package:hrm_system/model/response_data.dart';

import '../model/register_model.dart';
import '../routes/routes.dart';
import '../services/database_service.dart';

class LoginController extends GetxController{
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final dbService = DatabaseService();

  List<RegisterModel> list =[];

  var items = [
    'Admin',
    'User',
  ];

  String option = "";

  void getValues(String val){
    option = val;
    update();
  }
  void gotoRegister(){
    Get.toNamed(AppRoutes.register);
    update();
  }

  void login(BuildContext context) async {
    if (passCtrl.text == "" || emailCtrl.text.isEmpty) {
      Get.snackbar("ERROR", "Please enter all fields....");
      return;
    }

    LoginModel d = LoginModel(Globals.currentID, emailCtrl.text, passCtrl.text ,option);
    var response = await dbService.loginUser(d);
    if (response.status == "ERROR") {
      print("Error saving Expense");
      AnimatedSnackBar.material(
          '${response.data.type} login ${response.message}',
          type: AnimatedSnackBarType.error,
          duration: Duration(seconds: 3)
      ).show(
        context,
      );
      return;
    } else {
      AnimatedSnackBar.material(
          '${response.data.type}login${response.message}',
          type: AnimatedSnackBarType.success,
          duration: Duration(seconds: 3)
      ).show(
        context,
      );

    }
    update();
    if (response.status == "OK" && response.data.type == "Admin") {
      Globals.currentAdminID = response.data.id;
      print("admin id is:${Globals.currentAdminID}");
      Globals.Adminmodel = response.data;
      update();
      Get.toNamed(AppRoutes.adminView);
    }
    else{
      Globals.model = response.data;
      Globals.currentID = response.data.id;
      print("user id is:${Globals.currentAdminID}");
      update();
      Get.toNamed(AppRoutes.verifyAccount);
    }
  }

  @override
  void onInit(){
    Init();
    super.onInit();
  }

  void Init() async {
    ResponseData res = await dbService.getMaleList();
    list = res.data as List<RegisterModel>;
    update();
  }
}