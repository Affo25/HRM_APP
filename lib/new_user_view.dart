import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:hrm_attendance_app/model/globals.dart';
import 'package:hrm_attendance_app/model/guest_model.dart';
import 'package:hrm_attendance_app/services/database_service.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/app_colors.dart';
import '../../custom_widget/custom_RichText.dart';
import '../../custom_widget/custom_inputField.dart';
import '../../custom_widget/rounded_button.dart';
import '../custom_widget/custom_Text.dart';

import 'common/app_colors.dart';
import 'common/app_manager.dart';
import 'custom_widget/custom_Text.dart';
import 'model/event_model.dart';

class NewUserView extends StatefulWidget {
  final Event event;
  const NewUserView( {super.key, required this.event});

  @override
  State<NewUserView> createState() => _NewUserViewState();
}

class _NewUserViewState extends State<NewUserView> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final ticketCtrl = TextEditingController();
  final freeTicketCtrl = TextEditingController();

  final dbService = DatabaseService();

  var items = [
    'Admin',
    'User',
  ];

  String option = "";
  String file = "";

  File? pickedImage;

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImages != null) {
      file = pickedImages.path;
      setState(() {

      });
    }
  }




  void userRegistrtion(BuildContext context) async {
    if (nameCtrl.text == "" || emailCtrl.text.isEmpty) {
      Get.snackbar("ERROR", "Please enter all fields....");
      return;
    }

    GuestModel d = GuestModel(0,Globals.currentID, nameCtrl.text, file,emailCtrl.text,
      phoneCtrl.text,int.parse(ticketCtrl.text),int.parse(freeTicketCtrl.text),false);
    var response = await dbService.createGuest(d);
    if (response.status == "ERROR") {
      print("Error register User");
      defaultSuccessMessage("User Register ${response.message}");
      return;
    } else {
      defaultSuccessMessage("User Register ${response.message}");
    }
    nameCtrl.text="";
    passCtrl.text="";
    emailCtrl.text="";
    file="";
    phoneCtrl.text="";
    Globals.updateAttendance!();
    Navigator.pop(context);
   }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: blueShades2,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: blueShades2,
          centerTitle: true,
          title: Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Icon(Icons.arrow_back_ios,color: whiteColor,size: 30,)),
              SizedBox(width: 25,),
              CustomText(
                customText: "Add Guests",
                customColor: whiteColor,
                customFontSize: 28,
              ),
            ],
          ),
        ),
        body: ListView  (
          children: [
            InkWell(
              onTap: (){
                pickImages();
              },
              child: Container(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(25), // Image radius
                    child: file==""?Text("select image",style: TextStyle(color: Colors.black),):Image.file(File(file)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: CustomText(
                customText: "Please fill the details to create new user.",
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
                controller: nameCtrl,
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
                controller: emailCtrl,
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
                controller: phoneCtrl,
                textValue: "Enter phoneNo",
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  width: 150,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  child: customInputField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    controller: ticketCtrl,
                    textValue: "Total Tickets",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  width: 150,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  child: customInputField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    controller: freeTicketCtrl,
                    textValue: "Total  free Tickets",
                  ),
                ),
              ],
            ),
            RoundedButton(
                onTap: (){
                  userRegistrtion(context);
                },
                text: "Register"),
          ],
        )
    );
  }
}
