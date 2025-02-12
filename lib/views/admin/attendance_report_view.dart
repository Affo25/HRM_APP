import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hrm_system/routes/routes.dart';
import '../../common/app_colors.dart';
import '../../controllers/admin_controllers/admin_dashboard_controllers.dart';
import '../../controllers/admin_controllers/single_user_report_controller.dart';
import '../../custom_widget/custom_Text.dart';
import '../../model/globals.dart';

class AttendanceReportView extends StatelessWidget {
   AttendanceReportView({super.key});

  final controller = Get.put(AdminDashboardControllers());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: GetBuilder<AdminDashboardControllers>(
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
                  child: controller.list2.length != 0
                      ? ListView.builder(
                      itemCount: controller.list2.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Globals.currentSelectedUserId = controller.list2[index].id;
                            Globals.currentSelectedUserName = controller.list2[index].name;
                            Globals.selectedModelforAttendance = controller.list2[index];
                            Get.toNamed(AppRoutes.singleReportView);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.sizeOf(context).width,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: ListTile(
                              title: CustomText(
                                customText: controller.list2[index].name.toString(),
                                customColor: blueShades2,
                                customFontSize: 16,
                              ),
                              subtitle: CustomText(
                                customText: controller.list2[index].email.toString(),
                                customColor: blueShades2,
                                customFontSize: 12,
                              ),
                              leading: CircleAvatar(
                                backgroundColor: blueShades2,
                                child: CustomText(
                                  customText: controller.list2[index].id.toString(),
                                  customColor: whiteColor,
                                  customFontSize: 12,
                                ),
                              ),
                              trailing: CircleAvatar(
                                backgroundColor: blueShades2,
                                child: Image.file(
                                  width: 50,
                                    height: 50,
                                    File(controller.list2[index].file.toString()
                                    )
                                )
                              ),
                            ),
                          )
                        );
                      },
                  )
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
}
