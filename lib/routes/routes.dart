import 'package:get/get.dart';
import 'package:hrm_system/views/admin/attendance_report_view.dart';
import 'package:hrm_system/views/attaendance_view.dart';
import 'package:hrm_system/views/dashboard_user_view.dart';
import 'package:hrm_system/views/leave_list_view.dart';
import 'package:hrm_system/views/leave_view.dart';
import 'package:hrm_system/views/login_view.dart';
import 'package:hrm_system/views/register_view.dart';
import 'package:hrm_system/views/splsh_view.dart';

import '../views/admin/home_view.dart';
import '../views/admin/leave_request_view.dart';
import '../views/admin/single_user_attendance.dart';
import '../views/attendace_report.dart';




class AppRoutes {
   static const splash = Routes.splashScreen;
   static const login = Routes.loginScreen;
   static const register = Routes.registerScreen;

   static const verifyAccount = Routes.verifyScreen;
   static const adminView = Routes.adminView;
   static const leaveview = Routes.leaveScreen;
   static const attendance = Routes.attendance;
   static const attendaceReport = Routes.report;
   static const leaveListView = Routes.leaveList;
   static const attendaceAdmin = Routes.attendaceAdmin;
   static const adminLeaveView = Routes.adminLeave;
   static const singleReportView = Routes.single_attendance;
  //
  // static const singleAccount = Routes.singleAccount;
  // static const settingscreen = Routes.setting;
  //
  // static const overview = Routes.overview;
  // static const loanDetail = Routes.loanDetail;
  // static const addLoan = Routes.addLoan;
  // static const loanList = Routes.loans;
  // static const suggestion = Routes.suggestion;
  // static const createSuggestion = Routes.newSuggestion;
  //
  // static const accBalance = Routes.accountBalance;





  static final routes = [
    GetPage(
      transitionDuration: const Duration(seconds: 1),
      name: Routes.splashScreen,
      page: () =>  SplshView(),
        transition: Transition.fadeIn,
    ),
    // GetPage(
    //     transitionDuration: const Duration(seconds: 1),
    //   name: Routes.single_attendance,
    //   page: () => SingleAtt(),
    //     transition: Transition.fadeIn
    // ),
    GetPage(
        transitionDuration: const Duration(seconds: 1),
      name: Routes.loginScreen,
      page: () => LoginView(),
      transition: Transition.fadeIn
    ),
    GetPage(
        transitionDuration: const Duration(seconds: 1),
        name: Routes.registerScreen,
        page: () => RegisterView(),
        transition: Transition.fadeIn
    ),
    GetPage(
        transitionDuration: const Duration(seconds: 1),
        name: Routes.verifyScreen,
        page: () => DashboardUserView(),
        transition: Transition.fadeIn
    ),
    GetPage(
        transitionDuration: const Duration(seconds: 1),
        name: Routes.adminView,
        page: () =>  HomeView(),
        transition: Transition.fadeIn
    ),
    GetPage(
        transitionDuration: const Duration(seconds: 1),
        name: Routes.leaveScreen,
        page: () =>   LeaveView(),
        transition: Transition.fadeIn
    ),
    GetPage(
        transitionDuration: const Duration(seconds: 1),
        name: Routes.attendance,
        page: () =>   AttendanceView(),
        transition: Transition.fadeIn
    ),
    GetPage(
        transitionDuration: const Duration(seconds: 1),
        name: Routes.report,
        page: () =>  AttendaceReport(),
        transition: Transition.fadeIn
    ),
    GetPage(
        transitionDuration: const Duration(seconds: 1),
        name: Routes.leaveList,
        page: () =>  LeaveListView(),
        transition: Transition.fadeIn
    ),
    GetPage(
        transitionDuration: const Duration(seconds: 1),
        name: Routes.attendaceAdmin,
        page: () =>  AttendanceReportView(),
        transition: Transition.fadeIn
    ),
    GetPage(
        transitionDuration: const Duration(seconds: 1),
        name: Routes.adminLeave,
        page: () =>   LeaveRequestView(),
        transition: Transition.fadeIn
    ),
    GetPage(
        transitionDuration: const Duration(seconds: 1),
        name: Routes.single_attendance,
        page: () =>   SingleUserAttendance(),
        transition: Transition.fadeIn
    ),

  ];
}

class Routes {
  static const splashScreen = '/splash_screen';
  //static const onBoardingScreen = '/onBoarding_screen';

  static const loginScreen = '/login_screen';

  static const registerScreen = '/register_screen';

  static const verifyScreen = '/verifyAcc_screen';
  static const adminView = '/admin_screen';

  static const leaveScreen = '/leave_screen';

  static const attendance = '/attendance_screen';

  static const report = '/report_screen';
  static const leaveList = '/leaveList_screen';

  static const attendaceAdmin = '/attendaceAdmin_screen';
  static const adminLeave = '/adminLeave_screen';

  static const single_attendance = '/SingleUserAttendance_screen';

  static const setting = '/setting_screen';

  static const overview = '/overview_screen';
  static const loanDetail = '/loan_detail_screen';
  static const addLoan = '/loan_screen';
  static const loans = '/loan_list_screen';

  static const suggestion = '/suggestion_screen';

  static const newSuggestion = '/addSuggestion_screen';

  static const accountBalance = '/account_balance_screen';













}
