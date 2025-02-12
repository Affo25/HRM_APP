import 'package:get/get.dart';
import 'package:hrm_system/model/globals.dart';
import 'package:hrm_system/model/leave_model.dart';
import 'package:hrm_system/views/attendace_report.dart';

import '../model/attendance_model.dart';
import '../services/database_service.dart';

class AttendanceReportController extends GetxController{
  final dbservice = DatabaseService();

  List<AttendanceModel> list = [];

  @override
  void onInit(){
    Init();
    super.onInit();
  }

  void Init() async {
      var resp = await dbservice.getuserList(Globals.model!.id);
      list = resp.data as List<AttendanceModel>;
    update();
  }
}