
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/guest_model.dart';
import '../model/leave_model.dart';
import '../model/event_model.dart';
import '../model/response_data.dart';

class DatabaseService {


  Future<ResponseData> getEvents() async {
    try {
      print('getRegisterlist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('Event');
      List<Event> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(Event.fromJson(data)));
      }
      return ResponseData('OK', 'Success', budgetList);
    } catch (e) {
      print('getBudgets: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }


  Future<ResponseData> createNewEvent(Event exp) async {
    try {
      print('saveBudget: Saving data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('Event');
      List<Event> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(Event.fromJson(data)));
        exp.id = budgetList.length +1;
        budgetList.add(exp);
        prefs.setString('Event', jsonEncode(budgetList));
      } else {
        exp.id = budgetList.length +1;
        budgetList.add(exp);
        prefs.setString('Event', jsonEncode(budgetList));
      }
      return ResponseData('OK', 'Success', budgetList);
    } catch (e) {
      print('sendFeedback: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }



  Future<ResponseData> createGuest(GuestModel exp) async {
    try {
      print('saveleave: Saving data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('guest');
      List<GuestModel> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(GuestModel.fromJson(data)));
        exp.userId = budgetList.length +1;
        budgetList.add(exp);
        prefs.setString('guest', jsonEncode(budgetList));
      } else {
        exp.userId = budgetList.length +1;
        budgetList.add(exp);
        prefs.setString('guest', jsonEncode(budgetList));
      }
      return ResponseData('OK', 'Success', budgetList);
    } catch (e) {
      print('saveguest: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> getGuestListById(int model) async {
    try {
      print('getGuestlist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('guest');
      List<GuestModel> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(GuestModel.fromJson(data)));
      }

      List<GuestModel> updatedList = budgetList.where((user)=> user.eventId == model).toList();
      print(updatedList.length);
      return ResponseData('OK', 'Success', updatedList);
    } catch (e) {
      print('getGuestlist: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }
  Future<ResponseData> getGuestList() async {
    try {
      print('getleavelist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('guest');
      List<GuestModel> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(GuestModel.fromJson(data)));
      }
      return ResponseData('OK', 'Success', budgetList);
    } catch (e) {
      print('getGuests: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }


  Future<ResponseData> updateGuestStatus(GuestModel updatedContact) async {
    try {
      print('getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('guest');
      List<GuestModel> contactList = [];

      if (jsonData != null) {
        // Decode JSON string to list of dynamic maps
        List<dynamic> jsonMap = jsonDecode(jsonData);

        // Convert each map to a Contact object and add to contactList
        jsonMap.forEach((data) => contactList.add(GuestModel.fromJson(data)));

        // Find the index of the updatedContact in the list
        var contact = contactList.firstWhere((contact) => contact.userId == updatedContact.userId);

        if (contact != null) {
          // Update the existing contact
          contact.status = updatedContact.status;
          //contactList.add(contact);
        } else {
          // Handle case where contact is not found (optional)
          return ResponseData('ERROR', 'Contact not found', []);
        }
      } else {
        // Handle case where jsonData is null (optional)
        return ResponseData('ERROR', 'No contacts found', []);
      }

      // Encode contactList to JSON string and save to SharedPreferences
      prefs.setString('guest', jsonEncode(contactList));

      return ResponseData('OK', 'updated successfully', contactList);
    } catch (e) {
      print('guestUpdted: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed to update', e.toString());
    }
  }
  Future<ResponseData> updateEvent(Event updatedContact) async {
    try {
      print('getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('Event');
      List<Event> contactList = [];

      if (jsonData != null) {
        // Decode JSON string to list of dynamic maps
        List<dynamic> jsonMap = jsonDecode(jsonData);

        // Convert each map to a Contact object and add to contactList
        jsonMap.forEach((data) => contactList.add(Event.fromJson(data)));

        // Find the index of the updatedContact in the list
        var contact = contactList.firstWhere((contact) => contact.id == updatedContact.id);

        if (contact != null) {
          // Update the existing contact
          contact.status = updatedContact.status;
          //contactList.add(contact);
        } else {
          // Handle case where contact is not found (optional)
          return ResponseData('ERROR', 'Contact not found', []);
        }
      } else {
        // Handle case where jsonData is null (optional)
        return ResponseData('ERROR', 'No contacts found', []);
      }

      // Encode contactList to JSON string and save to SharedPreferences
      prefs.setString('Event', jsonEncode(contactList));

      return ResponseData('OK', 'updated successfully', contactList);
    } catch (e) {
      print('guestUpdted: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed to update contact', e.toString());
    }
  }
  Future<ResponseData> removeEvent(int exp) async {
    try {
      print('getEventlist: Getting data');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('Event');
      List<Event> budgetList = [];

      if (jsonData != null) {
        List<dynamic> jsonMap = jsonDecode(jsonData);
        jsonMap.forEach((data) => budgetList.add(Event.fromJson(data)));
      }

      // Remove the attendance record with the specified currentLoginId
      budgetList.removeWhere((user) => user.id == exp);

      // Save the updated list back to shared preferences
      String updatedJsonData = jsonEncode(budgetList.map((user) => user.toJson()).toList());
      prefs.setString('Event', updatedJsonData);

      print('Event removed successfully');
      return ResponseData('OK', 'Event removed successfully', budgetList);
    } catch (e) {
      print('removeEvent: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }
}