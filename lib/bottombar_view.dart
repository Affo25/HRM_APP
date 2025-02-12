
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrm_attendance_app/model/event_model.dart';
import 'package:hrm_attendance_app/user_view.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'common/app_colors.dart';
import 'completed_event_view.dart';
import 'custom_widget/custom_Text.dart';
import 'home_view.dart';
import 'inprogress_view.dart';

class BottombarView extends StatefulWidget {
  const BottombarView({super.key});

  @override
  State<BottombarView> createState() => _BottombarViewState();
}

class _BottombarViewState extends State<BottombarView> {

  int selected = 0;
  bool heart = false;
  final controller = PageController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children:  [
            HomeView(),
            CompletedEventView(),
            InProgressView()
          ],
        ),
      ),
      bottomNavigationBar: StylishBottomBar(
        backgroundColor: blueShades2,
          currentIndex: selected,
          onTap: (int index){
            setState(() {
              selected = index;
              controller.jumpToPage(index);
            });
          },
          option: DotBarOptions(
            dotStyle: DotStyle.tile,
            gradient: const LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.pink,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          items: [
            BottomBarItem(
              icon: const Icon(
                Icons.house_outlined,
              ),
              selectedIcon: const Icon(Icons.house_rounded),
              selectedColor: Colors.white,
              unSelectedColor: Colors.grey,
              title: const Text('Event'),
              showBadge: true,
              badgeColor: Colors.purple,
              badgePadding: const EdgeInsets.only(left: 4, right: 4),
            ),
            BottomBarItem(
              icon: const Icon(Icons.done_all_sharp),
              selectedIcon: const Icon(Icons.star_rounded),
              selectedColor: Colors.white,
              // unSelectedColor: Colors.purple,
              // backgroundColor: Colors.orange,
              title: const Text('Completed'),
            ),
            BottomBarItem(
              icon: const Icon(Icons.incomplete_circle),
              selectedIcon: const Icon(Icons.star_rounded),
              selectedColor: Colors.white,
              // unSelectedColor: Colors.purple,
              // backgroundColor: Colors.orange,
              title: const Text('InProgress'),
            ),
          ]),
    );
  }
}
