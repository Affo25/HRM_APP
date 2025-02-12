import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/badge/gf_badge.dart';
import 'package:getwidget/shape/gf_badge_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:hrm_attendance_app/model/event_model.dart';
import 'package:hrm_attendance_app/services/database_service.dart';
import 'package:hrm_attendance_app/user_view.dart';

import '../../common/app_colors.dart';
import '../../common/text_design.dart';
import 'common/app_manager.dart';
import 'custom_widget/custom_Text.dart';
import 'event_view.dart';
import 'model/globals.dart';
import 'dart:math';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final dbService = DatabaseService();


  List<Event> employees = [];

  bool check = false;

  int selectedID=0;

  int selectedId =0;
  int completedList =0;
  int pendingList =0;



  void deleteEvent(BuildContext context) async {
    var response = await dbService.removeEvent(selectedID);
    if (response.status == "ERROR") {
      print("Error Event Deleted");
      defaultSuccessMessage("Event Deleted ${response.message}");
      return;
    } else {
      defaultSuccessMessage("Event Deleted ${response.message}");
    }
    Navigator.pop(context);
    Init();
  }
  void Init() {
    getEmployeeData();
    getList();
    setState(() {
    });
  }

  void getList() async {
    var resp = await dbService.getEvents();
    employees = resp.data as List<Event>;
    List outputList = employees.where((o) => o.status == true).toList();
    completedList = outputList.length;
     pendingList = employees.length - outputList.length;
    print(completedList);
    setState(() {
    });
  }

  void getEmployeeData() async {
    var resp = await dbService.getEvents();
    employees = resp.data as List<Event>;
    setState(() {
    });
  }

  void updateData()async{
    var resp = await dbService.getEvents();
    employees = resp.data as List<Event>;
    setState(() {
    });
  }



  @override
  void initState() {
    super.initState();
    Init();
    Globals.update=()=>{
      updateData()
    };
    setState(() {
    });
  }

  void updatelist(BuildContext context,int index) async {
    employees[index].status = check;
    setState(() {
    });
    var response = await dbService.updateEvent(employees[index]);
    if (response.status == "ERROR") {
      print("Error update Event");
      defaultErrorMessage("Event update ${response.message}");
      return;
    } else {
      defaultSuccessMessage("Event update ${response.message}");
    }
    Globals.update!();
    Init();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EventView()));
        },
        backgroundColor: blueShades2,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade200,
        title: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            CustomText(
              customText: "EVENT MANAGEMENT SYSTEM",
              customColor: blueShades2,
              customFontSize: 18,
            ),
          ],
        ),
      ),
      body: Stack(
//        fit: StackFit.expand,
        children: [
          Column(children: [
            Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  color: blueShades2,
                  // decoration: BoxDecoration(
                  //     color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: whiteColor,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            CustomText(
                              customText: DateTime.now().toString(),
                              customColor: whiteColor,
                              customFontSize: 14,
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: whiteColor,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  CustomText(
                                    customText:
                                    "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
                                    customColor: whiteColor,
                                    customFontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: whiteColor,
                        thickness: 1,
                        indent: 4,
                        endIndent: 9,
                      ),
                      Row(
                        children: [
                          CustomText(
                            customText: " Total Events Created:",
                            customColor: whiteColor,
                            customFontSize: 14,
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.all(5),
                            width: 50,
                            height: 35,
                            child: GFBadge(
                              child: Text(
                                employees.length.toString(),
                                style: commonDesigns.statusText,
                              ),
                              shape: GFBadgeShape.standard,
                              size: GFSize.LARGE,
                              color: GFColors.INFO,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            customText: "Completed Events:",
                            customColor: whiteColor,
                            customFontSize: 14,
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.all(5),
                            width: 50,
                            height: 35,
                            child: GFBadge(
                              child: Text(
                                completedList.toString(),
                                style: commonDesigns.statusText,
                              ),
                              shape: GFBadgeShape.standard,
                              size: GFSize.LARGE,
                              color: GFColors.INFO,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            customText: "Pending Events:",
                            customColor: whiteColor,
                            customFontSize: 14,
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.all(5),
                            width: 50,
                            height: 35,
                            child: GFBadge(
                              child: Text(
                                pendingList.toString(),
                                style: commonDesigns.statusText,
                              ),
                              shape: GFBadgeShape.standard,
                              size: GFSize.LARGE,
                              color: GFColors.INFO,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ),
            Expanded(
                flex: 7,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  color: Colors.grey.shade200,
                  child:
                  Column(
                    children: [
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomText(
                              customText: "Total Events",
                              customColor: blueShades2,
                              customFontSize: 19,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: employees.length==0?
                        CustomText(
                          customText: "No Events Found",
                          customColor: Colors.black,
                          customFontSize: 16,
                        ):ListView.builder(
                            itemCount: employees.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: (){
                                  Globals.currentID = employees[index].id;
                                  setState(() {});
                                  Event evn = employees[index];
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserView(event: evn)));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(8))),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10,top: 10),
                                            child: CustomText(
                                              customText: employees[index].name.toString().toUpperCase(),
                                              customColor: blueShades2,
                                              customFontSize: 16,
                                            ),
                                          ),
                                          Spacer(),
                                          employees[index].status==true? Container():
                                          CustomText(
                                            customText: "Completed:",
                                            customColor: blueShades2,
                                            customFontSize: 16,
                                          ),
                                          employees[index].status==true? Container(
                                            margin: EdgeInsets.only(left: 10),
                                            width: 50,
                                            height: 35,
                                            child: GFBadge(
                                              child: Icon(Icons.done_outline_outlined,color: whiteColor,),
                                              shape: GFBadgeShape.standard,
                                              size: GFSize.LARGE,
                                              color: GFColors.SUCCESS,
                                            ),
                                          ):
                                          Checkbox(
                                            checkColor: Colors.white,
                                            activeColor: blueShades2,
                                            value: employees[index].status, onChanged: (bool? value) {
                                            check = value!;
                                            selectedId = index;
                                            setState(() {
                                            });
                                            updatelist(context,selectedId);
                                          },
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2, right: 20,left: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              customText: "Start Date:",
                                              customColor: blueShades2,
                                              customFontSize: 14,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(right: 10,top: 5),
                                              width: 110,
                                              height: 23,
                                              child: GFBadge(
                                                child: Text(
                                                  employees[index].startDate,
                                                  style: commonDesigns.statusText,
                                                ),
                                                shape: GFBadgeShape.standard,
                                                size: GFSize.LARGE,
                                                color: GFColors.FOCUS,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5, right: 20,left: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              customText: "End Date:",
                                              customColor: blueShades2,
                                              customFontSize: 14,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(right: 10,top: 5),
                                              width: 110,
                                              height: 23,
                                              child: GFBadge(
                                                child: Text(
                                                  employees[index].endDate,
                                                  style: commonDesigns.statusText,
                                                ),
                                                shape: GFBadgeShape.standard,
                                                size: GFSize.LARGE,
                                                color: GFColors.FOCUS,
                                              ),
                                            ),
                                            Spacer(),
                                            InkWell(
                                              onTap: (){
                                                selectedID = employees[index].id;
                                                DeleteRecord(context);
                                              },
                                              child: Container(
                                                width: 50,
                                                height: 35,
                                                child: GFBadge(
                                                  child: Icon(
                                                    Icons.delete_forever_outlined,
                                                    color: whiteColor,
                                                  ),
                                                  shape: GFBadgeShape.standard,
                                                  size: GFSize.LARGE,
                                                  color: GFColors.DANGER,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
            )
          ]),
        ],
      ),
    );
  }

  void DeleteRecord(BuildContext context) {
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          backgroundColor: Colors.transparent,
          child: WillPopScope(
            onWillPop: () async => false,
            child: Container(
              height: 200,
              padding: EdgeInsets.all(10),
              decoration:
              BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text("Confirmation Message", style: commonDesigns.subHeaddingText),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Do You want to Delete this Record?",
                      style: commonDesigns.subHeaddingText,
                    ),
                  ),
                  Divider(
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 100,
                          height: 30,
                          child: GFBadge(
                            child: Text(
                              "cancel",
                              style: commonDesigns.statusText,
                            ),
                            shape: GFBadgeShape.standard,
                            size: GFSize.LARGE,
                            color: GFColors.WARNING,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      InkWell(
                        onTap: () {
                          deleteEvent(context);
                        },
                        child: Container(
                          width: 100,
                          height: 30,
                          child: GFBadge(
                            child: Text(
                              "Yes",
                              style: commonDesigns.statusText,
                            ),
                            shape: GFBadgeShape.standard,
                            size: GFSize.LARGE,
                            color: GFColors.DANGER,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
