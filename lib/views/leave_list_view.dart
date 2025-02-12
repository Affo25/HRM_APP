import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hrm_system/controllers/leave_controller.dart';

import '../common/app_colors.dart';
import '../common/text_design.dart';
import '../controllers/attendance_report_controller.dart';
import '../custom_widget/custom_Text.dart';
import '../model/globals.dart';
import '../routes/routes.dart';

class LeaveListView extends StatelessWidget {
  LeaveListView({super.key});
  final controller = Get.put(LeaveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.leaveview);
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
        body: GetBuilder<LeaveController>(
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
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(4))),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10, right: 10),
                                          child: CustomText(
                                            customText: controller.list[index].startDate,
                                            customColor: blueShades2,
                                            customFontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2, left: 10),
                                      child: Row(
                                        children: [
                                          CustomText(
                                            customText: "Reason:",
                                            customColor: blueShades2,
                                            customFontSize: 14,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          CustomText(
                                            customText: controller.list[index].reason,
                                            customColor: blueShades2,
                                            customFontSize: 14,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, left: 3),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            customText: "Message:",
                                            customColor: blueShades2,
                                            customFontSize: 14,
                                          ),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          Text(
                                            controller.list[index].message,
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: commonDesigns.buttonText3,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            customText: "Status:",
                                            customColor: blueShades2,
                                            customFontSize: 14,
                                          ),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Container(
                                            width: 80,
                                            height: 35,
                                            child: controller.list[index].status=="Approved"?GFBadge(
                                              child: Text(
                                                controller.list[index].status,
                                                style: commonDesigns.statusText,
                                              ),
                                              shape: GFBadgeShape.standard,
                                              size: GFSize.LARGE,
                                              color: GFColors.SUCCESS,
                                            ):GFBadge(
                                              child: Text(
                                                controller.list[index].status,
                                                style: commonDesigns.statusText,
                                              ),
                                              shape: GFBadgeShape.standard,
                                              size: GFSize.LARGE,
                                              color: GFColors.WARNING,
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
                              customText: "No Leave found",
                              customColor: blueShades2,
                              customFontSize: 14,
                            ),
                          ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
