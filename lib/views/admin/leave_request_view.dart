import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../common/app_colors.dart';
import '../../common/text_design.dart';
import '../../controllers/admin_controllers/admin_leave_controller.dart';
import '../../custom_widget/custom_Text.dart';
import '../../model/globals.dart';

class LeaveRequestView extends StatelessWidget {
  LeaveRequestView({super.key});
  final controller = Get.put(AdminLeaveController());

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
              customText: "Attendance View",
              customColor: whiteColor,
              customFontSize: 18,
            ),
          ],
        ),
      ),
      body: GetBuilder<AdminLeaveController>(
        builder: (controller) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        customText: "Show all",
                        customColor: blueShades2,
                        customFontSize: 18,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: controller.list.length != 0
                      ? ListView.builder(
                          itemCount: controller.list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.all(8),
                              width: MediaQuery.sizeOf(context).width,
                              height: 160,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(4))),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: CustomText(
                                          customText: "${controller.list[index].duration} days",
                                          customColor: blueShades2,
                                          customFontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: CustomText(
                                          customText: controller.list[index].startDate,
                                          customColor: Colors.black,
                                          customFontSize: 18,
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: CustomText(
                                          customText: controller.list[index].name,
                                          customColor: blueShades2,
                                          customFontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 11,
                                  ),
                                  controller.list[index].status == "Declined" || controller.list[index].status == "Approved"
                                      ? Container(
                                          width: 150,
                                          height: 30,
                                          child: GFBadge(
                                            child: Text(
                                              controller.list[index].status == "Declined"?"Decline":"Approved",
                                              style: commonDesigns.statusText,
                                            ),
                                            shape: GFBadgeShape.standard,
                                            size: GFSize.LARGE,
                                            color: controller.list[index].status == "Declined"?GFColors.DANGER: GFColors.SUCCESS,
                                          ),
                                        )
                                      : Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller.userid = controller.list[index].userId;
                                                controller.loginid =
                                                    controller.list[index].currentLoginId;
                                                controller.updateLeave(context, "Approved");
                                              },
                                              child: Container(
                                                width: 150,
                                                height: 30,
                                                child: GFBadge(
                                                  child: Text(
                                                    "Approved",
                                                    style: commonDesigns.statusText,
                                                  ),
                                                  shape: GFBadgeShape.standard,
                                                  size: GFSize.LARGE,
                                                  color: GFColors.INFO,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.userid = controller.list[index].userId;
                                                controller.loginid =
                                                    controller.list[index].currentLoginId;
                                                controller.updateLeave(context, "Declined");
                                              },
                                              child: Container(
                                                width: 150,
                                                height: 30,
                                                child: GFBadge(
                                                  child: Text(
                                                    "Decline",
                                                    style: commonDesigns.statusText,
                                                  ),
                                                  shape: GFBadgeShape.standard,
                                                  size: GFSize.LARGE,
                                                  color: GFColors.FOCUS,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      show(controller.list[index].reason,
                                          controller.list[index].message);
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: CustomText(
                                            customText: "Overview",
                                            customColor: blueShades2,
                                            customFontSize: 13,
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: blueShades,
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
      ),
    );
  }

  void show(String reason, String message) {
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
                    child: Text("Leave Detail View", style: commonDesigns.subHeaddingText),
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
                      reason,
                      style: commonDesigns.subHeaddingText,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      message,
                    ),
                  ),
                  Divider(
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 150,
                      height: 30,
                      child: GFBadge(
                        child: Text(
                          "cancel",
                          style: commonDesigns.statusText,
                        ),
                        shape: GFBadgeShape.standard,
                        size: GFSize.LARGE,
                        color: GFColors.FOCUS,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
