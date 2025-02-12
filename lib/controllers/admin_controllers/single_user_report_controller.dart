import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_system/common/app_manager.dart';
import 'package:hrm_system/model/attendance_model.dart';
import 'package:intl/intl.dart';

import '../../model/globals.dart';
import '../../model/leave_model.dart';
import '../../model/register_model.dart';
import '../../services/database_service.dart';

class SingleUserReportController extends GetxController{

  List<AttendanceModel> list = [];
  List<LeaveRequest> leaveList = [];


  final dbService = DatabaseService();
  List<RegisterModel> Registerusers = [];

  String date = "";
String month = "";

String currentDate = "";

String end ="";

String attendance ="";
int value =0;

String grade ="";
  void setValue(int val){
    value = val;
    update();
  }
  void Init() async {
    List<String> myList =[];
    DateTime now = DateTime.now();
    DateTime now2 = DateTime.now();
    date = DateFormat('yyyy-MM-dd').format(now);
    month = DateFormat('MMMM').format(now2);
    var resp = await dbService.getUsersAttendance(Globals.currentSelectedUserId);
    list = resp.data as List<AttendanceModel>;
    print(list.length.toString());
    list.forEach((attendance){
      if (attendance.attendance == "Present") {
        myList.add(attendance.attendance);
       update();
      }
    });
    if (myList.length>=26) {
      grade = "A";
      update();
    } else if (myList.length > 10 && myList.length < 26) {
      grade="B";
      update();
    }   else{
      grade="D";
      update();
    }
    update();
  }

  void UpdateInit() async {
    List<String> myList =[];
    DateTime now = DateTime.now();
    DateTime now2 = DateTime.now();
    date = DateFormat('yyyy-MM-dd').format(now);
    month = DateFormat('MMMM').format(now2);
    var resp = await dbService.getUsersAttendance(Globals.currentSelectedUserId);
    list = resp.data as List<AttendanceModel>;
    print(list.length.toString());
    list.forEach((attendance){
      if (attendance.attendance == "Present") {
        myList.add(attendance.attendance);
        update();
      }
    });
    if (myList.length>=26) {
      grade = "A";
      update();
    } else if (myList.length > 10 && myList.length < 26) {
      grade="B";
      update();
    }   else{
      grade="D";
      update();
    }
    update();
  }

  void getUserList() async {
    DateTime now = DateTime.now();
    date = DateFormat('yyyy-MM-dd').format(now);
    var resp = await dbService.getUsers();
    Registerusers = resp.data as List<RegisterModel>;
    print(list.length.toString());
    update();
  }

  void getfilterList(BuildContext context)async{
    var resp = await dbService.getFilterUsersAttendance(currentDate,end);
    list = resp.data as List<AttendanceModel>;
    update();
  }

  void getLeaves()async{
    var resp = await dbService.getSelectedUserLeaves(Globals.currentSelectedUserId);
    leaveList = resp.data as List<LeaveRequest>;
    update();
  }

  @override
  void onInit(){
    Globals.updateAttendance=(){
      UpdateInit();
    };
    getUserList();
    getLeaves();
    Init();
    super.onInit();
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

  void removeData(BuildContext context,int id)async{
    var resp = await dbService.removeUserById(id);
    if (resp.status == "ERROR") {
      print("Error saving Expense");
      AnimatedSnackBar.material(
          '${resp.data.type} login ${resp.message}',
          type: AnimatedSnackBarType.error,
          duration: Duration(seconds: 3)
      ).show(
        context,
      );
      return;
    } else {
      AnimatedSnackBar.material(
          '${resp.data.type}login${resp.message}',
          type: AnimatedSnackBarType.success,
          duration: Duration(seconds: 3)
      ).show(
        context,
      );

    }
    Init();
    update();
  }

  void getattendance(String val){
    attendance = val;
    print(attendance);
    update();
  }

  void sendAttendanceRequest(BuildContext context) async {
    if (attendance == "" || Globals.selectedModelforAttendance!.name=="") {
      defaultErrorMessage( "Please enter all fields....");
      return;
    }

    AttendanceModel d = AttendanceModel(userId: 0, currentLoginId: Globals.selectedModelforAttendance!.id,name: Globals.selectedModelforAttendance!.name,
        date: date,email: Globals.selectedModelforAttendance!.email,attendance: attendance);
    var response = await dbService.markAttendance(d);
    if (response.status == "ERROR") {
      print("Error saving attendance");
      AnimatedSnackBar.rectangle(
          'Error',
          ' Saving attendance${response.message}',
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
          ' Saving attendance${response.message}',
          type: AnimatedSnackBarType.success,
          brightness: Brightness.light,
          duration: Duration(seconds: 3)
      ).show(
        context,
      );

    }
    Globals.updateAttendance!();
    update();
    Get.back();
    Init();
  }
}