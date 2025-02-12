
import 'package:hrm_system/model/register_model.dart';

import 'attendance_model.dart';

class Globals {

  static int currentID =0;
  static int currentAdminID = 0;
  static int currentSelectedUserId = 0;
  static int selectedIdForDelete = 0;
  static String currentSelectedUserName = "";
  static Function? update;
  static Function? updateAttendance;
  static Function? updateLeave;
  static String instituteName = "";

  static RegisterModel? model;

  static AttendanceModel? selectedModel;

  static AttendanceModel? markUserAttendance;

  static RegisterModel? Adminmodel;

  static RegisterModel? selectedModelforAttendance;
}
