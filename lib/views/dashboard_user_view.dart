import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hrm_system/controllers/dashboard_controller.dart';
import 'package:hrm_system/model/globals.dart';
import 'package:hrm_system/routes/routes.dart';

import '../common/app_colors.dart';
import '../common/text_design.dart';
import '../custom_widget/custom_Text.dart';
import '../custom_widget/rounded_button.dart';

class DashboardUserView extends StatelessWidget {
  DashboardUserView({super.key});

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: blueShades2,
          title: Row(
            children: [
              CustomText(
                customText: "Good Morning!",
                customColor: whiteColor,
                customFontSize: 18,
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
                    color: whiteColor,
                  )),
            )
          ],
        ),
        body: GetBuilder<DashboardController>(
          builder: (controller) {
            return Stack(
//        fit: StackFit.expand,
              children: [
                Column(children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        color: blueShades2,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        controller.pickImages(context);
                                      },
                                      child: ClipOval(
                                          child: Image.file(
                                        File(controller.file == ""
                                            ? Globals.model!.file
                                            : controller.file),
                                        fit: BoxFit.cover,
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                                  child: Column(
                                    children: [
                                      CustomText(
                                        customText: Globals.model!.name,
                                        customColor: Colors.white,
                                        customFontSize: 28,
                                      ),
                                      CustomText(
                                        customText: Globals.model!.email,
                                        customColor: greyColor,
                                        customFontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                        color: Colors.grey.shade200,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            RoundedButton4(
                                onTap: () {
                                  Get.toNamed(AppRoutes.attendance);
                                },
                                text: "Mark Attendance"),
                            SizedBox(
                              height: 20,
                            ),
                            RoundedButton4(
                                onTap: () {
                                  Get.toNamed(AppRoutes.attendaceReport);
                                },
                                text: " Attendance Report"),
                            SizedBox(
                              height: 20,
                            ),
                            RoundedButton4(
                                onTap: () {
                                  Get.toNamed(AppRoutes.leaveListView);
                                },
                                text: "Leave Request")
                          ]),
                        ),
                      ))
                ]),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: 20,
                    right: 20,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(14))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: blueShades2,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                CustomText(
                                  customText: controller.date,
                                  customColor: blueShades2,
                                  customFontSize: 14,
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        color: blueShades2,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      CustomText(
                                        customText:
                                            "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
                                        customColor: blueShades2,
                                        customFontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            customText: " Take Your today Attendance",
                            customColor: blueShades2,
                            customFontSize: 14,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            customText: " Today Status",
                            customColor: blueShades2,
                            customFontSize: 14,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          controller.statusUser.isNotEmpty
                              ? Container(
                                  width: 80,
                                  height: 35,
                                  child: GFBadge(
                                    child: Text(
                                      "PRESENT",
                                      style: commonDesigns.statusText,
                                    ),
                                    shape: GFBadgeShape.standard,
                                    size: GFSize.LARGE,
                                    color: GFColors.SUCCESS,
                                  ),
                                )
                              : Container(
                                  width: 100,
                                  height: 35,
                                  child: GFBadge(
                                    child: Text(
                                      "No Update",
                                      style: commonDesigns.statusText,
                                    ),
                                    shape: GFBadgeShape.standard,
                                    size: GFSize.LARGE,
                                    color: GFColors.INFO,
                                  ),
                                ),
                        ],
                      ),
                    ))
              ],
            );
          },
        )
    );
  }
}
