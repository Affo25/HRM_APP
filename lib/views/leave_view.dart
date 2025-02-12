import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hrm_system/controllers/leave_controller.dart';

import '../common/app_colors.dart';
import '../controllers/login_controller.dart';
import '../custom_widget/custom_Text.dart';
import '../custom_widget/custom_inputField.dart';
import '../custom_widget/rounded_button.dart';

class LeaveView extends StatelessWidget {
   LeaveView({super.key});

  final controller = Get.put(LeaveController());

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
                radius: 25,
                backgroundColor: Colors.white,
                child: Image(image: Svg('assets/images/Vector.svg',)),
              ),
            ),
            SizedBox(width: 20,),
            CustomText(
              customText: "Leave Request!",
              customColor: whiteColor,
              customFontSize: 18,
            ),
          ],
        ),
      ),
      body: GetBuilder<LeaveController>(
        builder: (controller){
          return Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ListView(
                children: [
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
                      controller: controller.reasonCtrl,
                      textValue: "Reason here",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    width: MediaQuery.sizeOf(context).width,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                    child: customInputField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      controller: controller.messageCtrl,
                      textValue: "Message here",
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
                    child:  DropdownButtonHideUnderline(
                      child: DropdownButton2<int>(
                        isExpanded: true,
                        hint: Text(
                          controller.option==0?'Select Duration':controller.option.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: controller.items
                            .map((int item) => DropdownMenuItem<int>(
                          value: item,
                          child: Text(
                            item.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                            .toList(),
                        //value: controller.option,
                        onChanged: (int? value) {
                          controller.getValues(value??0);
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          width: 140,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      controller.getDate(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      width: MediaQuery.sizeOf(context).width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10),
                        child: CustomText(
                          customText: controller.currentDate==""?"Start Date": controller.currentDate,
                          customColor: blueShades2,
                          customFontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  RoundedButton(
                      onTap: (){
                        controller.sendRequest(context);
                      },
                      text: "Send leave"
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
