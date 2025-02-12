import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hrm_system/controllers/register_controller.dart';
import '../../common/app_colors.dart';
import '../../custom_widget/custom_RichText.dart';
import '../../custom_widget/custom_inputField.dart';
import '../../custom_widget/rounded_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../custom_widget/custom_Text.dart';

class RegisterView extends StatelessWidget {
   RegisterView({super.key});

  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: blueShades2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blueShades2,
        centerTitle: true,
        title: CustomText(
          customText: " User Register",
          customColor: whiteColor,
          customFontSize: 28,
        ),
      ),
      body: GetBuilder<RegisterController>(
        builder: (controller){
          return ListView  (
            children: [
              InkWell(
                onTap: (){
                  controller.pickImages();
                },
                child: Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(25), // Image radius
                      child: controller.file==""?Text("select image",style: TextStyle(color: Colors.black),):Image.file(File(controller.file.toString()), fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: CustomText(
                  customText: "Please fill the details to create account.",
                  customColor: whiteColor,
                  customFontSize: 12,
                ),
              ),
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
                  controller:controller.nameCtrl,
                  textValue: "Enter name",
                ),
              ),
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
                  controller:controller.emailCtrl,
                  textValue: "Enter email",
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                width: MediaQuery.sizeOf(context).width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(350))
                ),
                child: customInputField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller:controller.phoneCtrl,
                  textValue: "Enter phoneNo",
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                width: MediaQuery.sizeOf(context).width,
                height: 60,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(350))
                ),
                child:  DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      controller.option==""?'Select User Type': controller.option,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controller.items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    //value: controller.option,
                    onChanged: (String? value) {
                      controller.getValues(value??"");
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                width: MediaQuery.sizeOf(context).width,
                height: 60,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(350))
                ),
                child: customInputField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller:controller.passCtrl,
                  textValue: "Enter password",
                ),
              ),
              RoundedButton(
                  onTap: (){
                    controller.userRegistrtion(context);
              },
                  text: "Register Now"),
              const SizedBox(height: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomRichText(
                      onTap:
                      TapGestureRecognizer()
                        ..onTap = () {
                          controller.gotoLogin();
                        },
                      customText2: "Login Now",
                      customText1: "Already have an account!",
                      customFontSize: 12,
                      customColor: secondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      )
    );
  }
}




