import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_colors.dart';
import '../common/text_design.dart';
import '../routes/routes.dart';
import 'custom_container_widget.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});

  //final myController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade100,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.close(1);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.close,
                      color: primaryColor,
                      size: 40,
                    ),
                    Text(
                      "Close menu",
                      style: commonDesigns.subHeaddingText,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "HRM",
                  style: GoogleFonts.ubuntu(
                      color: secondaryColor3,
                      fontSize: 40,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'SYSTEM',
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w400,
                            color: primaryColor,
                            fontSize: 40,
                            letterSpacing: 1)),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  //Get.to(DashboardScreen(),transition: Transition.upToDown);
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.dashboard,
                          size: 28,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        "Dashboard",
                        style: commonDesigns.subHeaddingText90,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.attendaceAdmin);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 244, 244, 1),
                      borderRadius: const BorderRadius.all(Radius.circular(16))),
                  child: ListTile(
                    leading: Icon(
                      Icons.report,
                      color: primaryColor,
                    ),
                    title: Text(
                      "Attendance View",
                      style: commonDesigns.subHeaddingText91,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.adminLeaveView);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 244, 244, 1),
                      borderRadius: const BorderRadius.all(Radius.circular(16))),
                  child: ListTile(
                    leading: Icon(
                      Icons.leave_bags_at_home,
                      color: primaryColor,
                    ),
                    title: Text(
                      "Leave View",
                      style: commonDesigns.subHeaddingText91,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade200,
                thickness: 1,
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.attendaceAdmin);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 244, 244, 1),
                      borderRadius: const BorderRadius.all(Radius.circular(16))),
                  child: ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: primaryColor,
                    ),
                    title: Text(
                      "Setting View",
                      style: commonDesigns.subHeaddingText91,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
