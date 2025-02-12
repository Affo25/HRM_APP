import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:hrm_system/controllers/login_controller.dart';

import '../common/app_colors.dart';
import '../common/app_manager.dart';
import '../custom_widget/custom_RichText.dart';
import '../custom_widget/custom_Text.dart';
import '../custom_widget/custom_inputField.dart';
import '../custom_widget/rounded_button.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: blueShades2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blueShades2,
      ),
      body: GetBuilder<LoginController>(
        builder: (controller){
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                child: CustomText(
                  customText: "HRM LOGIN",
                  customColor: whiteColor,
                  customFontSize: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: CustomText(
                  customText: "Login your account to continue.",
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
                    borderRadius: BorderRadius.all(Radius.circular(16))
                ),
                child: customInputField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller:controller.passCtrl,
                  textValue: "Enter password",
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
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      controller.option==""?'Select User Type':controller.option,
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
              RoundedButton(
                  onTap: (){
                    controller.login(context);
                  },
                  text: "Login Now"
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomRichText(
                      onTap:
                      TapGestureRecognizer()
                        ..onTap = () {
                          controller.gotoRegister();
                        },
                      customText2: "Register",
                      customText1: "Don’t have an account?",
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
