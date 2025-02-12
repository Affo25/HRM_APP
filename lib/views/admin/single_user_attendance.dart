import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:group_button/group_button.dart';

import '../../common/app_colors.dart';
import '../../common/text_design.dart';
import '../../controllers/admin_controllers/single_user_report_controller.dart';
import '../../custom_widget/custom_Text.dart';
import '../../model/globals.dart';

class SingleUserAttendance extends StatelessWidget {
  SingleUserAttendance({super.key});
  final controller = Get.put(SingleUserReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueShades2,
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
              customText: "${Globals.currentSelectedUserName} Attendance Report",
              customColor: whiteColor,
              customFontSize: 18,
            ),
          ],
        ),
      ),
      body: GetBuilder<SingleUserReportController>(
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
                      child: Column(
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
                                customText: " Month:",
                                customColor: whiteColor,
                                customFontSize: 14,
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 65,
                                height: 35,
                                child: GFBadge(
                                  child: Text(
                                    controller.month,
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
                                    controller.leaveList.length.toString(),
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
                                customText: " Grade:",
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
                                    controller.grade,
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
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      color: Colors.grey.shade200,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: CustomText(
                                  customText: "Show all",
                                  customColor: blueShades2,
                                  customFontSize: 15,
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
                                      size: 30,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
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
                                                  // ClipOval(
                                                  //     child: Image.file(
                                                  //   File(controller.list[index].),
                                                  //   fit: BoxFit.cover,
                                                  //   width: 40,
                                                  //   height: 40,
                                                  // )),
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
                                    child: Column(
                                      children: [
                                        CustomText(
                                          customText: "No Record Found",
                                          customColor: blueShades2,
                                          customFontSize: 14,
                                        ),
                                        InkWell(
                                          onTap: (){
                                            AddAttendance(context);
                                          },
                                          child: Container(
                                            width: 140,
                                            height: 35,
                                            child: GFBadge(
                                              child: Text(
                                                "Add Attendance",
                                                style: commonDesigns.statusText,
                                              ),
                                              shape: GFBadgeShape.standard,
                                              size: GFSize.LARGE,
                                              color: GFColors.PRIMARY,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ))
              ]),
            ],
          );
        },
      ),
    );
  }

  void AddAttendance(BuildContext context) {
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
                    child: Text("Add Attendance View", style: commonDesigns.subHeaddingText),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  Container(
                    width: 120,
                    height: 40,
                    child:
                    GroupButton(
                      isRadio:true,
                      options: GroupButtonOptions(
                        selectedShadow: const [],
                        selectedTextStyle:  const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        selectedColor:  blueShades2,
                        unselectedShadow: const [],
                        unselectedColor: const Color.fromRGBO(215, 221, 253,1),
                        unselectedTextStyle:  const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        selectedBorderColor: null,
                        borderRadius: BorderRadius.circular(16),
                        spacing: 5,
                        runSpacing: 5,
                        groupingType: GroupingType.wrap,
                        direction: Axis.horizontal,
                        buttonHeight: 40,
                        buttonWidth: 120,
                        mainGroupAlignment: MainGroupAlignment.center,
                        crossGroupAlignment: CrossGroupAlignment.start,
                        groupRunAlignment: GroupRunAlignment.start,
                        textAlign: TextAlign.center,
                        textPadding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        elevation: 0,
                      ),
                      maxSelected: 1,
                      onSelected: (data, index, isSelected) {
                        controller.getattendance(data.toString());
                      },
                      buttons:  [
                        "Present",
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  InkWell(
                    onTap: () {
                     controller.sendAttendanceRequest(context);
                    },
                    child: Container(
                      width: 150,
                      height: 30,
                      child: GFBadge(
                        child: Text(
                          "Send",
                          style: commonDesigns.statusText,
                        ),
                        shape: GFBadgeShape.standard,
                        size: GFSize.LARGE,
                        color: GFColors.INFO,
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
