import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hrm_system/controllers/leave_controller.dart';
import 'package:hrm_system/model/globals.dart';

import '../common/app_colors.dart';
import '../common/text_design.dart';
import '../controllers/attendance_report_controller.dart';
import '../custom_widget/custom_Text.dart';

class AttendaceReport extends StatelessWidget {
  AttendaceReport({super.key});

  final controller = Get.put(AttendanceReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: blueShades2,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Image(
                      image: Svg(
                    'assets/images/Vector.svg',
                  )),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              CustomText(
                customText: " Attendance Report",
                customColor: whiteColor,
                customFontSize: 18,
              ),
            ],
          ),
        ),
        body: GetBuilder<AttendanceReportController>(
          builder: (controller) {
            return Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                children: [
                  Expanded(
                    child: controller.list.length != 0
                        ? ListView.builder(
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, left: 10),
                                      child: Row(
                                        children: [
                                          ClipOval(
                                              child: Image.file(
                                            File(Globals.model!.file),
                                            fit: BoxFit.cover,
                                            width: 40,
                                            height: 40,
                                          )),
                                          SizedBox(
                                            width: 14,
                                          ),
                                          Column(
                                            children: [
                                              CustomText(
                                                customText: controller.list[index].name,
                                                customColor: blueShades2,
                                                customFontSize: 14,
                                              ),
                                              CustomText(
                                                customText: controller.list[index].email,
                                                customColor: blueShades2,
                                                customFontSize: 14,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          CustomText(
                                            customText: controller.list[index].date,
                                            customColor: blueShades2,
                                            customFontSize: 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, right: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                        : Center(
                            child: CustomText(
                              customText: "No Attendance Report found",
                              customColor: blueShades2,
                              customFontSize: 14,
                            ),
                          ),
                  )
                ],
              ),
            );
          },
        )
    );
  }
}
