

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common/app_colors.dart';
import '../common/text_design.dart';

class RoundedButton extends StatelessWidget{
  RoundedButton({required this.onTap, required this.text, Key?key,
}):super(key:key);
 final VoidCallback? onTap;
 final String? text;

  //final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: MediaQuery.sizeOf(context).width/0.8,
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              secondaryColor,
              secondaryColor2,
            ],
          )
      ),
      child: TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text!,style: commonDesigns.buttonText,),
            SizedBox(width: 10,),
            const Icon(Icons.arrow_forward,color: whiteColor,size: 33,),
          ],
        ),
      ),
    );
  }

}

class RoundedButton2 extends StatelessWidget{
  RoundedButton2({required this.onTap, required this.text, Key?key,
  }):super(key:key);
  final VoidCallback? onTap;
  final String? text;

  //final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: MediaQuery.sizeOf(context).width/1.6,
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              blueShades2,
              blueShades,
            ],
          )
      ),
      child: TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text!,style: commonDesigns.buttonText,),
            SizedBox(width: 10,),
            const Icon(Icons.arrow_forward,color: whiteColor,size: 33,),
          ],
        ),
      ),
    );
  }

}
class RoundedButton3 extends StatelessWidget{
  RoundedButton3({required this.onTap, required this.text, Key?key,
  }):super(key:key);
  final VoidCallback? onTap;
  final String? text;

  //final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: Get.width/1.2,
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(350)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              secondaryColor,
              secondaryColor2,
            ],
          )
      ),
      child: TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text!,style: commonDesigns.buttonText,),
            SizedBox(width: 10,),
            const Icon(Icons.arrow_forward,color: whiteColor,size: 33,),
          ],
        ),
      ),
    );
  }

}



class RoundedButton4 extends StatelessWidget{
  RoundedButton4({required this.onTap, required this.text, Key?key,
  }):super(key:key);
  final VoidCallback? onTap;
  final String? text;

  //final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(350)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              blueShades,
              blueShades2,
            ],
          )
      ),
      child: TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text!,style: commonDesigns.buttonText2,),
          ],
        ),
      ),
    );
  }

}