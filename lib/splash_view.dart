import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hrm_attendance_app/common/app_colors.dart';

import 'bottombar_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> BottombarView()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: secondaryColor,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20.0, height: 20.0),
            const Text(
              'EVENT',
              style: TextStyle(fontSize: 43.0,color: Colors.deepPurple),
            ),
            const SizedBox(width: 20.0, height: 100.0),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 40.0,
                fontFamily: 'Horizon',
                  color: Colors.deepPurple
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText('MANAGEMENT'),
                  RotateAnimatedText('SYSTEM'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
            ],
        ),
      ),
    );
  }
}
