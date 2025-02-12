
import 'dart:convert';

import 'package:hrm_system/model/leave_model.dart';
import 'package:hrm_system/model/login.dart';
import 'package:hrm_system/model/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/attendance_model.dart';
import '../model/response_data.dart';

class DatabaseService {


  Future<ResponseData> getMaleList() async {
    try {
      print('getRegisterlist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-register');
      List<RegisterModel> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(RegisterModel.fromJson(data)));
      }
      return ResponseData('OK', 'Success', budgetList);
    } catch (e) {
      print('getBudgets: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }


  Future<ResponseData> registerUser(RegisterModel exp) async {
    try {
      print('saveBudget: Saving data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-register');
      List<RegisterModel> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(RegisterModel.fromJson(data)));
        exp.id = budgetList.length +1;
        budgetList.add(exp);
        prefs.setString('user-register', jsonEncode(budgetList));
      } else {
        exp.id = budgetList.length +1;
        budgetList.add(exp);
        prefs.setString('user-register', jsonEncode(budgetList));
      }
      return ResponseData('OK', 'Success', budgetList);
    } catch (e) {
      print('sendFeedback: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> loginUser(LoginModel model) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-register');
      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        List<RegisterModel> userList = jsonMap.map((data) => RegisterModel.fromJson(data)).toList();

        RegisterModel? user = userList.firstWhere((user) => user.email == model.email && user.password == model.password) as RegisterModel?;

        if (user != null) {
          return ResponseData('OK', 'User found', user);
        } else {
          return ResponseData('ERROR', 'User not found', null);
        }
      } else {
        return ResponseData('ERROR', 'No users found', null);
      }
    } catch (e) {
      print('findUserById: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> loadUser(RegisterModel model) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-register');

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        List<RegisterModel> userList = jsonMap.map((data) => RegisterModel.fromJson(data)).toList();

        RegisterModel? user = userList.firstWhere((user) => user.id == model.id);

        if (user != null) {
          return ResponseData('OK', 'User found', user);
        } else {
          return ResponseData('ERROR', 'User not found', null);
        }
      } else {
        return ResponseData('ERROR', 'No users found', null);
      }
    } catch (e) {
      print('findUserById: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> getUsers() async {
    try {
      print('getUserslist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-register');
      List<RegisterModel> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(RegisterModel.fromJson(data)));
      }
      List<RegisterModel> updatedList = budgetList.where((user)=> user.type == "User").toList();
      print(updatedList.length);
      return ResponseData('OK', 'Success', updatedList);
    } catch (e) {
      print('getusers: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> sendLeave(LeaveRequest exp) async {
    try {
      print('saveleave: Saving data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-leave');
      List<LeaveRequest> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(LeaveRequest.fromJson(data)));
        exp.userId = budgetList.length +1;
        budgetList.add(exp);
        prefs.setString('user-leave', jsonEncode(budgetList));
      } else {
        exp.userId = budgetList.length +1;
        budgetList.add(exp);
        prefs.setString('user-leave', jsonEncode(budgetList));
      }
      return ResponseData('OK', 'Success', budgetList);
    } catch (e) {
      print('sendleave: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> getuserLeaves(int currentUserId) async {
    try {
      print('getleavelist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-leave');
      List<LeaveRequest> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(LeaveRequest.fromJson(data)));
      }

      List<LeaveRequest> updatedList = budgetList.where((user)=> user.currentLoginId == currentUserId).toList();
      print(updatedList.length);
      return ResponseData('OK', 'Success', updatedList);
    } catch (e) {
      print('getleave: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> getSelectedUserLeaves(int currentUserId) async {
    try {
      print('getleavelist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-leave');
      List<LeaveRequest> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(LeaveRequest.fromJson(data)));
      }

      List<LeaveRequest> updatedList = budgetList.where((user)=> user.currentLoginId == currentUserId).toList();
      print(updatedList.length);
      return ResponseData('OK', 'Success', updatedList);
    } catch (e) {
      print('getleave: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> UpdteLeaveRequest(LeaveRequest updatedContact) async {
    try {
      print('saveContact: Saving data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-leave');
      List<LeaveRequest> contactList = [];

      if (jsonData != null) {
        // Decode JSON string to list of dynamic maps
        List<dynamic> jsonMap = jsonDecode(jsonData);
        // Convert each map to a Contact object and add to contactList
        jsonMap.forEach((data) => contactList.add(LeaveRequest.fromJson(data)));
        // Find the index of the updatedContact in the list
        var contact = contactList.firstWhere((contact) => contact.userId == updatedContact.userId);
        if (contact != null) {
          // Update the existing contact
          contact.status = updatedContact.status;
          //contactList.add(contact);
        } else {
          // Handle case where contact is not found (optional)
          return ResponseData('ERROR', 'data not found', contactList);
        }
      } else {
        // Handle case where jsonData is null (optional)
        return ResponseData('ERROR', 'No data found', []);
      }

      // Encode contactList to JSON string and save to SharedPreferences
      prefs.setString('user-leave', jsonEncode(contactList));

      return ResponseData('OK', 'Data updated successfully', contactList);
    } catch (e) {
      print('updatedContact: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed to update Data', e.toString());
    }
  }

  Future<ResponseData> alluserLeaves() async {
    try {
      print('getleavelist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-leave');
      List<LeaveRequest> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(LeaveRequest.fromJson(data)));
      }
      return ResponseData('OK', 'Success', budgetList);
    } catch (e) {
      print('getleave: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> markAttendance(AttendanceModel exp) async {
    try {
      print('saveAttendance: Saving data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-attendance');
      List<AttendanceModel> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(AttendanceModel.fromJson(data)));
        exp.userId = budgetList.length +1;
        budgetList.add(exp);
        prefs.setString('user-attendance', jsonEncode(budgetList));
      } else {
        exp.userId = budgetList.length +1;
        budgetList.add(exp);
        prefs.setString('user-attendance', jsonEncode(budgetList));
      }
      return ResponseData('OK', 'Success', budgetList);
    } catch (e) {
      print('sendAttendance: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> removeAttendance(int exp) async {
    try {
      print('getattendancelist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-attendance');
      List<AttendanceModel> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(AttendanceModel.fromJson(data)));
      }

      // Remove the attendance record with the specified currentLoginId
      budgetList.removeWhere((user) => user.userId == exp);

      // Save the updated list back to shared preferences
      String updatedJsonData = jsonEncode(budgetList.map((user) => user.toJson()).toList());
      prefs.setString('user-attendance', updatedJsonData);

      print('User removed successfully');
      return ResponseData('OK', 'User removed successfully', budgetList);
    } catch (e) {
      print('removeAttendance: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }
  Future<ResponseData> getuserList(int currentUserId) async {
    try {
      print('getattendancelist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-attendance');
      List<AttendanceModel> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(AttendanceModel.fromJson(data)));
      }
      
       List<AttendanceModel> updatedList = budgetList.where((user)=> user.currentLoginId == currentUserId).toList();
      print(updatedList.length);
      return ResponseData('OK', 'Success', updatedList);
    } catch (e) {
      print('getattendance: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> UpdteContact(RegisterModel updatedContact) async {
    try {
      print('saveContact: Saving data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-register');
      List<RegisterModel> contactList = [];

      if (jsonData != null) {
        // Decode JSON string to list of dynamic maps
        List<dynamic> jsonMap = jsonDecode(jsonData);

        // Convert each map to a Contact object and add to contactList
        jsonMap.forEach((data) => contactList.add(RegisterModel.fromJson(data)));

        // Find the index of the updatedContact in the list
        var contact = contactList.firstWhere((contact) => contact.id == updatedContact.id);

        if (contact != null) {
          // Update the existing contact
          contact.file = updatedContact.file;
          //contactList.add(contact);
        } else {
          // Handle case where contact is not found (optional)
          return ResponseData('ERROR', 'Contact not found', contactList);
        }
      } else {
        // Handle case where jsonData is null (optional)
        return ResponseData('ERROR', 'No contacts found', []);
      }

      // Encode contactList to JSON string and save to SharedPreferences
      prefs.setString('user-register', jsonEncode(contactList));

      return ResponseData('OK', 'UserProfile updated successfully', contactList);
    } catch (e) {
      print('updatedContact: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed to update contact', e.toString());
    }
  }

  Future<ResponseData> getUsersAttendance(int model) async {
    try {
      print('gettingSingleUserAttendance: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-attendance');
      List<AttendanceModel> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(AttendanceModel.fromJson(data)));
      }

      List<AttendanceModel> updatedList = budgetList.where((user)=> user.currentLoginId == model).toList();
      print(updatedList.length);
      return ResponseData('OK', 'Success', updatedList);
    } catch (e) {
      print('getSingleUserAttendance: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> getTodayAttendanceList(String model) async {
    try {
      print('gettingSingleUserAttendance: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-attendance');
      List<AttendanceModel> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(AttendanceModel.fromJson(data)));
      }

      List<AttendanceModel> updatedList = budgetList.where((user)=> user.date == model).toList();
      print(updatedList.length);
      return ResponseData('OK', 'Success', updatedList);
    } catch (e) {
      print('getSingleUserAttendance: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> removeUserById(int recordId) async {
    try {
      print('removeUserById: Removing data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-attendance');
      List<AttendanceModel> attendanceList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => attendanceList.add(AttendanceModel.fromJson(data)));
      }

      // Remove the user with the specified ID
      attendanceList.removeWhere((user) => user.userId == recordId);

      // Save the updated list back to shared preferences
      String updatedJsonData = jsonEncode(attendanceList.map((user) => user.toJson()).toList());
      prefs.setString('user-attendance', updatedJsonData);

      print('User removed successfully');
      return ResponseData('OK', 'User removed successfully', attendanceList);
    } catch (e) {
      print('removeUserById: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> getFilterUsersAttendance(String fromDate, String toDate) async {
    try {
      print('getattendancelist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('user-attendance');
      List<AttendanceModel> attendanceList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => attendanceList.add(AttendanceModel.fromJson(data)));
      }

      DateTime fromDateTime = DateTime.parse(fromDate);
      print(fromDateTime);
      DateTime toDateTime = DateTime.parse(toDate);
      List<AttendanceModel> updatedList = attendanceList.where((user) {DateTime userDate = DateTime.parse(user.date);
        return userDate.isAfter(fromDateTime) && userDate.isBefore(toDateTime) || userDate.isAtSameMomentAs(fromDateTime) || userDate.isAtSameMomentAs(toDateTime);
      }).toList();

      print(updatedList.length);
      return ResponseData('OK', 'Success', updatedList);
    } catch (e) {
      print('getattendance: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }
}