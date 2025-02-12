import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_system/model/register_model.dart';
import 'package:hrm_system/routes/routes.dart';
import 'package:intl/intl.dart';

import '../../model/attendance_model.dart';
import '../../model/globals.dart';
import '../../model/leave_model.dart';
import '../../services/database_service.dart';
import '../../views/admin/home_view.dart';

class AdminDashboardControllers extends GetxController{

  DateTime now9 = DateTime.now();
  List<AttendanceModel> list = [];
  List<RegisterModel> list2 = [];
  String month = "";

  String currentDate = "";

  String end ="";

  final dbService = DatabaseService();
  DateTime startDate = DateTime.now();
  bool saved = false;

  String date = "";
  List<LeaveRequest> Leavelist = [];


  void getUserList() async {
    DateTime now = DateTime.now();
    date = DateFormat('yyyy-MM-dd').format(now);
    var resp = await dbService.getUsers();
    list2 = resp.data as List<RegisterModel>;
    print(list.length.toString());
    update();
  }

  void getLeaves()async{
    var resp = await dbService.alluserLeaves();
    Leavelist = resp.data as List<LeaveRequest>;
    update();
  }

  void Init() async {
    DateTime now = DateTime.now();
    DateTime now2 = DateTime.now();
    date = DateFormat('yyyy-MM-dd').format(now);
    month = DateFormat('MMMM').format(now2);
    getLeaves();
    var resp = await dbService.getTodayAttendanceList(date);
    list = resp.data as List<AttendanceModel>;
    print(list.length.toString());
    update();
  }

  void UpdateAttendance() async {
    DateTime now = DateTime.now();
    DateTime now2 = DateTime.now();
    date = DateFormat('yyyy-MM-dd').format(now);
    month = DateFormat('MMMM').format(now2);
    getLeaves();
    var resp = await dbService.getTodayAttendanceList(date);
    list = resp.data as List<AttendanceModel>;
    print(list.length.toString());
    update();
  }


  void removeAttendance(BuildContext context)async{
    var response = await dbService.removeAttendance(Globals.selectedIdForDelete);
    if (response.status == "ERROR") {
      print("Error Removing attendance");
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
          ' Removing attendance${response.message}',
          type: AnimatedSnackBarType.success,
          brightness: Brightness.light,
          duration: Duration(seconds: 3)
      ).show(
        context,
      );
    }
    Init();
    Get.back();
  }

  @override
  void onInit(){
    Globals.updateAttendance=(){
      UpdateAttendance();
    };
    getUserList();
    Init();
    super.onInit();
  }

  void getfilterList(BuildContext context)async{
    var resp = await dbService.getFilterUsersAttendance(currentDate,end);
    list = resp.data as List<AttendanceModel>;
    update();
  }

  void getDate(BuildContext context) async {
    showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((value) {
      currentDate = value!.start.toString();
      end = value.end.toString();
      getfilterList(context);
      print(currentDate);
      print(end);
      update();
    });
  }

}