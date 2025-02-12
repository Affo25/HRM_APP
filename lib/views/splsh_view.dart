import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fc_loaders/fc_loaders.dart';
import '../common/app_colors.dart';
import '../common/ui_helpers.dart';
import '../controllers/splsh_controller.dart';

class SplshView extends StatelessWidget {
   SplshView({super.key});
  
  final controller = Get.put(SplshController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: blueShades2,
      body: GetBuilder<SplshController>(
        builder: (GetxController controller) {
          return  SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child:   Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      curve: Curves.bounceInOut,
                      'HRM SYSTEM',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],

                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 100),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                verticalSpaceLarge,
                FCDualRipple(
                  backgroundColor: secondaryColor,
                  loaderColor: Colors.white,
                  duration: Duration(seconds: 1),
                  curve2: Curves.easeInOut,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
