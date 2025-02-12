import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_system/model/globals.dart';
import 'package:hrm_system/model/leave_model.dart';
import 'package:intl/intl.dart';

import '../routes/routes.dart';
import '../services/database_service.dart';

class LeaveController extends GetxController{

  final reasonCtrl = TextEditingController();
  final messageCtrl = TextEditingController();
  final dbService = DatabaseService();

  var items = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
  ];

  int option = 0;
  void getValues(int val){
    option = val;
    update();
  }
  DateTime selectedDate = DateTime.now();
  String currentDate = "";
  void getDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ).then((value) {
        currentDate = DateFormat("dd-MMM-yyyy").format(value!);
      update();
    });
  }

  void sendRequest(BuildContext context) async {
    if (reasonCtrl.text == "" || option==0) {
      Get.snackbar("ERROR", "Please enter all fields....");
      return;
    }

    LeaveRequest d = LeaveRequest(userId: 0, currentLoginId: Globals.model!.id,name: Globals.model!.name,reason:reasonCtrl.text,duration:
    option,startDate: currentDate.toString(),status: "PENDING", message: messageCtrl.text);
    var response = await dbService.sendLeave(d);
    if (response.status == "ERROR") {
      print("Error sending leave");
      AnimatedSnackBar.rectangle(
          'Error',
          'sending leave request${response.message}',
          type: AnimatedSnackBarType.error,
          brightness: Brightness.light,
          duration: Duration(seconds: 3)
      ).show(
        context,
      );
      return;
    } else {
      AnimatedSnackBar.rectangle(
          'Success',
          'Sending leave request${response.message}',
          type: AnimatedSnackBarType.success,
          brightness: Brightness.light,
          duration: Duration(seconds: 3)
      ).show(
        context,
      );

    }
    Globals.updateLeave!();
      Get.back();
  }

  List<LeaveRequest> list = [];

  @override
  void onInit(){
    Globals.updateLeave=(){
      UpdateList();
    };
    Init();
    super.onInit();
  }

  void UpdateList() async {
    var resp = await dbService.getuserLeaves(Globals.model!.id);
    list = resp.data as List<LeaveRequest>;
    update();
  }

  void Init() async {
    var resp = await dbService.getuserLeaves(Globals.model!.id);
    list = resp.data as List<LeaveRequest>;
    update();
  }
}