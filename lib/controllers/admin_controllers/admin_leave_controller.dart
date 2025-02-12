import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hrm_system/model/globals.dart';
import 'package:intl/intl.dart';

import '../../model/leave_model.dart';
import '../../services/database_service.dart';

class AdminLeaveController extends GetxController{


  DateTime now9 = DateTime.now();
  List<LeaveRequest> list = [];

  final dbService = DatabaseService();
  DateTime startDate = DateTime.now();
  bool saved = false;

  String date = "";

LeaveRequest? reques;

int userid =0;
int loginid =0;

  void Init() async {
    DateTime now = DateTime.now();
    date = DateFormat('yyyy-MM-dd').format(now);
    var resp = await dbService.alluserLeaves();
    list = resp.data as List<LeaveRequest>;
    print(list.length.toString());
    update();
  }

  @override
  void onInit(){
    Init();
    super.onInit();
  }

  void updateLeave(BuildContext context,String status) async {
    LeaveRequest d = LeaveRequest(userId: userid, currentLoginId: loginid, name: "", reason: "", message: "", duration: 0, startDate: "", status: status);
    var response = await dbService.UpdteLeaveRequest(d);
    if (response.status == "ERROR") {
      print("Error Updating status");
      AnimatedSnackBar.rectangle(
          'Error',
          'Leave Approved${response.message}',
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
          ' leave Approved${response.message}',
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
}