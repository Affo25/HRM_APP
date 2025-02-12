import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hrm_attendance_app/model/event_model.dart';
import 'package:hrm_attendance_app/services/database_service.dart';

import 'common/app_colors.dart';
import 'common/text_design.dart';
import 'custom_widget/custom_Text.dart';
import 'model/globals.dart';

class InProgressView extends StatefulWidget {
  const InProgressView({super.key});

  @override
  State<InProgressView> createState() => _InProgressViewState();
}

class _InProgressViewState extends State<InProgressView> {
  final dbService = DatabaseService();

  List<Event> guest = [];

  void Init() {
    getEmployeeData();
    setState(() {});
  }

  void getEmployeeData() async {
    var resp = await dbService.getEvents();
    guest = resp.data as List<Event>;
    List oyput = guest.where((e) => e.status == false).toList();
    guest = oyput as List<Event>;
    setState(() {});
  }

  void updateData() async {
    var resp = await dbService.getEvents();
    guest = resp.data as List<Event>;
    List oyput = guest.where((e) => e.status == false).toList();
    guest = oyput as List<Event>;
    setState(() {});
  }

  @override
  void initState() {
    Init();
    Globals.updateAttendance = () => {updateData()};
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blueShades2,
        title: Row(
          children: [
            CustomText(
              customText: "InProgress Events",
              customColor: whiteColor,
              customFontSize: 18,
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: Colors.grey.shade200,
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomText(
                    customText: "Show List",
                    customColor: blueShades2,
                    customFontSize: 19,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: guest.length == 0
                  ? CustomText(
                      customText: "No In Progress Event Found",
                      customColor: Colors.black,
                      customFontSize: 14,
                    )
                  : ListView.builder(
                      itemCount: guest.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          width: MediaQuery.sizeOf(context).width,
                          height: 130,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: CustomText(
                                      customText: guest[index].name.toString().toUpperCase(),
                                      customColor: blueShades2,
                                      customFontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 1),
                                          child: CustomText(
                                            customText: "StartDate:",
                                            customColor: blueShades2,
                                            customFontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 1),
                                          width: 90,
                                          height: 25,
                                          child: GFBadge(
                                            child: Text(guest[index].startDate.toString()),
                                            shape: GFBadgeShape.standard,
                                            size: GFSize.LARGE,
                                            color: GFColors.ALT,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 3),
                                          child: CustomText(
                                            customText: "EndDate:",
                                            customColor: blueShades2,
                                            customFontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 1),
                                          width: 90,
                                          height: 25,
                                          child: GFBadge(
                                            child: Text(guest[index].endDate.toString()),
                                            shape: GFBadgeShape.standard,
                                            size: GFSize.LARGE,
                                            color: GFColors.INFO,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, right: 20, left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      customText: "Venue:",
                                      customColor: blueShades2,
                                      customFontSize: 14,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 70,
                                      height: 25,
                                      child: GFBadge(
                                        child: Text(
                                          guest[index].venue,
                                          style: commonDesigns.statusText,
                                        ),
                                        shape: GFBadgeShape.standard,
                                        size: GFSize.LARGE,
                                        color: GFColors.SECONDARY,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10, top: 10),
                                    child: CustomText(
                                      customText: "Status:",
                                      customColor: blueShades2,
                                      customFontSize: 14,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    width: 90,
                                    height: 25,
                                    child: GFBadge(
                                      child: guest[index].status == false
                                          ? CustomText(
                                              customText: "InProgress",
                                              customColor: whiteColor,
                                              customFontSize: 14,
                                            )
                                          : Container(),
                                      shape: GFBadgeShape.standard,
                                      size: GFSize.LARGE,
                                      color: GFColors.WARNING,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
