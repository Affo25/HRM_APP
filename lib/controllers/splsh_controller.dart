
import 'package:get/get.dart';
import 'package:hrm_system/model/globals.dart';
import 'package:hrm_system/model/register_model.dart';
import 'package:hrm_system/model/response_data.dart';
import 'package:hrm_system/services/database_service.dart';

import '../common/app_manager.dart';
import '../routes/routes.dart';

class SplshController extends GetxController{

RegisterModel? currentlogin;

final dbservice = DatabaseService();



  @override
  void onInit(){
    Init();
    super.onInit();
  }

  void Init() async {
    currentlogin = Globals.model;
    //ResponseData response = await dbservice.loadUser(currentlogin!);
    // if (currentlogin!=null && currentlogin!.type == "Admin") {
    //   defaultSuccessMessage("Already Login");
    //   Get.toNamed(AppRoutes.verifyAccount);
    // }
    // else{
    //   defaultErrorMessage("Not found user, login first");
    //   Get.toNamed(AppRoutes.login);
    // }
    Future.delayed(const Duration(seconds: 5), () {
      //defaultSuccessMessage("Admin logged in already");
      Get.toNamed(AppRoutes.login);
    });
  }
}