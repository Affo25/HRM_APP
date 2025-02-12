import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/badge/gf_badge.dart';
import 'package:getwidget/shape/gf_badge_shape.dart';
import 'package:getwidget/size/gf_size.dart';

import '../../common/app_colors.dart';
import '../../common/text_design.dart';
import '../../controllers/admin_controllers/admin_dashboard_controllers.dart';
import '../../custom_widget/app_drawer.dart';
import '../../custom_widget/custom_Text.dart';
import '../../model/globals.dart';


class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(AdminDashboardControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerScreen(),
      backgroundColor: blueShades2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.align_horizontal_right,
              color: primaryColor,
            ),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          );
        }),
        backgroundColor: Colors.grey.shade100,
        title: Row(
          children: [
            CustomText(
              customText: "Admin Dashboard",
              customColor: primaryColor,
              customFontSize: 20,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.logout,
                  size: 30,
                  color: blueShades2,
                )),
          )
        ],
      ),
      body: GetBuilder<AdminDashboardControllers>(
        builder: (controller) {
          return Stack(
//        fit: StackFit.expand,
            children: [
              Column(children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 200,
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
                                  customText: controller.date,
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
                                customText: " Total Users:",
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
                                    controller.list2.length.toString(),
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
                                customText: " Total Present:",
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
                                    controller.list.length.toString(),
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
                                customText: " Total Leaves:",
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
                                    controller.Leavelist.length.toString(),
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
                                      customText: "Today Attendance",
                                      customColor: blueShades2,
                                      customFontSize: 19,
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: InkWell(
                                        onTap: () {
                                          controller.getDate(context);
                                        },
                                        child: Icon(
                                          Icons.filter_list,
                                          color: blueShades2,
                                          size: 28,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Expanded(
                                child: controller.list.length != 0?ListView.builder(
                                    itemCount: controller.list.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        margin: EdgeInsets.all(8),
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(4))),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: CustomText(
                                                    customText: controller.list[index].name,
                                                    customColor: blueShades2,
                                                    customFontSize: 14,
                                                  ),
                                                ),
                                               Spacer(),
                                                Container(
                                                  margin: EdgeInsets.only(right: 10,top: 10),
                                                  width: 80,
                                                  height: 20,
                                                  child: GFBadge(
                                                    child: Text(
                                                      controller.list[index].date,
                                                      style: commonDesigns.statusText,
                                                    ),
                                                    shape: GFBadgeShape.standard,
                                                    size: GFSize.LARGE,
                                                    color: GFColors.FOCUS,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    customText: controller.list[index].email,
                                                    customColor: blueShades2,
                                                    customFontSize: 14,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10, right: 20,left: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    customText: "Status:",
                                                    customColor: blueShades2,
                                                    customFontSize: 14,
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Container(
                                                    width: 80,
                                                    height: 35,
                                                    child: GFBadge(
                                                      child: Text(
                                                        controller.list[index].attendance,
                                                        style: commonDesigns.statusText,
                                                      ),
                                                      shape: GFBadgeShape.standard,
                                                      size: GFSize.LARGE,
                                                      color: GFColors.SUCCESS,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  InkWell(
                                                    onTap: (){
                                                     Globals.selectedIdForDelete = controller.list[index].userId;
                                                     DeleteRecord(context);
                                                    },
                                                    child: Container(
                                                      width: 80,
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
                                      );
                                    }): Center(
                                  child: CustomText(
                                    customText: "No Record Found",
                                    customColor: blueShades2,
                                    customFontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ))
              ]),
              // Positioned(
              //     top: MediaQuery.of(context).size.height * 0.2,
              //     left: 20,
              //     right: 20,
              //     child:
              // )
            ],
          );
        },
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
                          controller.removeAttendance(context);
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
