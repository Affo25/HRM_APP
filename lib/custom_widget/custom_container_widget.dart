import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/text_design.dart';

class customContainerDrawer extends StatelessWidget {
   customContainerDrawer({super.key, required this.onTap, required this.text, required this.icon});

  final VoidCallback onTap;
  final String text;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      width: MediaQuery.sizeOf(context).width,
      height: 50,
      decoration:  BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 1),
          borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      child: ListTile(
        leading:  Icon(
          icon,
          color: primaryColor,
        ),
        title:  Text(text,style: commonDesigns.subHeaddingText91,),
        onTap: onTap,
      ),
    );
  }
}

class CustomDateContainer extends StatelessWidget {
  CustomDateContainer({super.key, required this.onTap, required this.text, required this.icon});

  final VoidCallback onTap;
  final String text;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
      width: 160,
      height: 65,
      decoration:  BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 1),
          borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      child: ListTile(
        leading:  Icon(
          icon,
          color: primaryColor,
        ),
        title:  Text(text,style: commonDesigns.subHeaddingText91,),
        onTap: onTap,
      ),
    );
  }
}
