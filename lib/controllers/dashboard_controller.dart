import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:hrm_system/model/attendance_model.dart';
import 'package:hrm_system/model/globals.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../model/register_model.dart';
import '../services/database_service.dart';

class DashboardController extends GetxController{


  String date = "";
  String time ="";

  String attendance ="";

  bool check = false;
  DatePickerController datePickerController = DatePickerController();
  DateTime now9 = DateTime.now();

  final dbService = DatabaseService();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  bool saved = false;

  final dbservice = DatabaseService();

  List<AttendanceModel> list = [];


  @override
  void onInit(){
    Globals.updateAttendance=(){
      updateAttendance();
    };
    Init();
    startDate = DateTime.now();
    endDate = DateTime(now9.year, now9.month + 2, 0);
    print('startDate = $startDate ; endDate = $endDate');
    DateTime now = DateTime.now();
    date = DateFormat('yyyy-MM-dd').format(now);
    super.onInit();
  }

String statusUser = "";
  File? pickedImage;

  String file ="";

  String attendanceDate ="";

  void updateAttendance() async {
    var resp = await dbservice.getuserList(Globals.model!.id);
    list = resp.data as List<AttendanceModel>;
    statusUser = list.lastOrNull!.attendance;
    attendanceDate = list.lastOrNull!.date;
    update();
    print(statusUser);
    print(attendanceDate);
    update();
  }

  void Init() async {
    var resp = await dbservice.getuserList(Globals.model!.id);
    list = resp.data as List<AttendanceModel>;
    statusUser = list.lastOrNull!.attendance;
    attendanceDate = list.lastOrNull!.date;
    update();
    print(statusUser);
    print(attendanceDate);
    update();
  }


  Future<void> pickImages(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImages != null) {
      file = pickedImages.path;
      update();
    }
    updateUserProfile(context);
  }

  void getattendance(String val){
    attendance = val;
    check=true;
    print(attendance);
    update();
  }

  void sendAttendanceRequest(BuildContext context) async {
    if (attendance == "" || Globals.model!.name=="") {
      Get.snackbar("ERROR", "Please enter all fields....");
      return;
    }

    AttendanceModel d = AttendanceModel(userId: 0, currentLoginId: Globals.model!.id,name: Globals.model!.name,date: date,email: Globals.model!.email,attendance: attendance);
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
    saved=true;
    Globals.updateAttendance!();
    update();
    Get.back();
  }

  void updateUserProfile(BuildContext context) async {
    RegisterModel d = RegisterModel(Globals.model!.id, Globals.model!.name, Globals.model!.email, Globals.model!.phone,
        Globals.model!.password,Globals.model!.type,file);
    var response = await dbService.UpdteContact(d);
    if (response.status == "ERROR") {
      print("Error Updating UserProfile");
      AnimatedSnackBar.rectangle(
          'Error',
          ' Updating UserProfile ${response.message}',
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
          ' Updating UserProfile ${response.message}',
          type: AnimatedSnackBarType.success,
          brightness: Brightness.light,
          duration: Duration(seconds: 3)
      ).show(
        context,
      );
    }
    Globals.model = response.data;
    update();
    print(Globals.currentID);
  }
}