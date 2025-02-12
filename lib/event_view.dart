import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_attendance_app/model/globals.dart';
import 'package:hrm_attendance_app/services/database_service.dart';
import 'package:intl/intl.dart';

import 'common/app_colors.dart';
import 'common/app_manager.dart';
import 'custom_widget/custom_Text.dart';
import 'custom_widget/custom_inputField.dart';
import 'custom_widget/rounded_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'model/event_model.dart';
class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  var items = [
    'Admin',
    'User',
  ];
  String option = "";

  final nameCtrl = TextEditingController();
  final venueCtrl = TextEditingController();
  final detailCtrl = TextEditingController();

  final dbService = DatabaseService();
  DateTime selectedDate = DateTime.now();

  String currentDate = "";

  String currentDate2 = "";
  void getDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ).then((value) {
      currentDate = DateFormat("dd-MMM-yyyy").format(value!);
      setState(() {

      });
    });
  }

  void getDate2(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ).then((value) {
      currentDate2 = DateFormat("dd-MMM-yyyy").format(value!);
      setState(() {

      });
    });

  }

  void createEvent(BuildContext context) async {
    if (nameCtrl.text == "" || currentDate.isEmpty|| currentDate2.isEmpty) {
      errorMessageToast( context,"Please enter all fields....",);
      return;
    }

    Event d = Event(0, nameCtrl.text, venueCtrl.text,currentDate??"",currentDate2??"",detailCtrl.text,false);
    var response = await dbService.createNewEvent(d);
    if (response.status == "ERROR") {
      print("Error Event User");
      defaultSuccessMessage("Event Register ${response.message}");
      return;
    } else {
      defaultSuccessMessage("Event Register ${response.message}");
    }
    nameCtrl.text="";
    venueCtrl.text="";
    detailCtrl.text="";
   currentDate2="";
   currentDate="";
   Globals.update!();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: blueShades2,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: blueShades2,
          centerTitle: true,
          title: Row(
            children: [
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios,color: whiteColor,size: 30,)),
              SizedBox(width: 25,),
              CustomText(
                customText: "Event View",
                customColor: whiteColor,
                customFontSize: 28,
              ),
            ],
          ),
        ),
        body: ListView  (
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: CustomText(
                customText: "Please fill the details to create new event.",
                customColor: whiteColor,
                customFontSize: 19,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              width: MediaQuery.sizeOf(context).width,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: customInputField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: nameCtrl,
                textValue: "Enter name",
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            //   padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            //   width: MediaQuery.sizeOf(context).width,
            //   height: 60,
            //   decoration: const BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.all(Radius.circular(16))
            //   ),
            //   child:  DropdownButtonHideUnderline(
            //     child: DropdownButton2<String>(
            //       isExpanded: true,
            //       hint: Text('Select User Type',
            //         style: TextStyle(
            //           fontSize: 14,
            //           color: Theme.of(context).hintColor,
            //         ),
            //       ),
            //       items: items
            //           .map((String item) => DropdownMenuItem<String>(
            //         value: item,
            //         child: Text(
            //           item,
            //           style: const TextStyle(
            //             fontSize: 14,
            //           ),
            //         ),
            //       ))
            //           .toList(),
            //       //value: controller.option,
            //       onChanged: (String? value) {
            //         //controller.getValues(value??"");
            //       },
            //       buttonStyleData: const ButtonStyleData(
            //         padding: EdgeInsets.symmetric(horizontal: 16),
            //         height: 40,
            //         width: 140,
            //       ),
            //       menuItemStyleData: const MenuItemStyleData(
            //         height: 40,
            //       ),
            //     ),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    getDate(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    width: 150,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                    child:   Center(
                      child: CustomText(
                        customText: currentDate==""?"Start Date.":currentDate,
                        customColor: blueShades2,
                        customFontSize: 15,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    getDate2(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    width: 150,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                    child:   Center(
                      child: CustomText(
                        customText: currentDate2==""?"End Date.":currentDate2,
                        customColor: blueShades2,
                        customFontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              width: MediaQuery.sizeOf(context).width,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: customInputField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: venueCtrl,
                textValue: "Address",
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              width: MediaQuery.sizeOf(context).width,
              height: 60,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: customInputField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: detailCtrl,
                textValue: "Event detail",
              ),
            ),
            RoundedButton(
                onTap: (){
                  createEvent(context);
                },
                text: "Create EVent"),
          ],
        )
    );
  }
}
