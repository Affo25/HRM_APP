import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:group_button/group_button.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';
import 'package:hrm_system/controllers/dashboard_controller.dart';
import 'package:hrm_system/model/globals.dart';

import '../common/app_colors.dart';
import '../common/text_design.dart';
import '../custom_widget/custom_Text.dart';

class AttendanceView extends StatelessWidget {
   AttendanceView({super.key});

  final controller = Get.put(DashboardController());


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blueShades2,
        title: Row(
          children: [
            InkWell(
              onTap: (){
                Get.back();
              },
              child:  CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Image(image: Svg('assets/images/Vector.svg',)),
              ),
            ),
            SizedBox(width: 20,),
            CustomText(
              customText: "Mark Attendance!",
              customColor: whiteColor,
              customFontSize: 18,
            ),
          ],
        ),
      ),
      body: GetBuilder<DashboardController>(
        builder: (controller){
          return ListView(
            children: [
              Container(
                color: Colors.grey,
                alignment: Alignment.center,
                child: HorizontalDatePickerWidget(
                  locale: 'en',
                  startDate: controller.startDate,
                  endDate: controller.endDate,
                  selectedDate: controller.now9,
                  widgetWidth: MediaQuery.of(context).size.width,
                  datePickerController: controller.datePickerController,
                  onValueSelected: (date) {
                    print('selected = ${date.toIso8601String()}');
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                width: MediaQuery.sizeOf(context).width,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                ),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people,
                            color: blueShades2,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          CustomText(
                            customText: Globals.model!.name,
                            customColor: blueShades2,
                            customFontSize: 14,
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: blueShades2,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                CustomText(
                                  customText:
                                  Globals.model!.email,
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
                      height: 8,
                    ),
                    CustomText(
                      customText: " Mark Attendance",
                      customColor: blueShades2,
                      customFontSize: 14,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 120,
                      height: 40,
                      child: controller.statusUser!="Present" ?
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
                      ):Container(
                        width: 120,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.green.shade700,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Icon(Icons.done,color: Colors.white,size: 28,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              controller.statusUser!="Present"?
              InkWell(
                onTap: (){
                   controller.sendAttendanceRequest(context);
                },
                child: Container(
                  margin: EdgeInsets.all(12),
                  width: 80,
                  height: 60,
                  child: GFBadge(
                    child: Text("Submit attendance",style: commonDesigns.statusText,),
                    shape: GFBadgeShape.standard,
                    size: GFSize.LARGE,
                    color: blueShades2,
                  ),
                ),
              ):Container(),
            ],
          );
        },
      )
    );
  }
}
