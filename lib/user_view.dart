import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/badge/gf_badge.dart';
import 'package:getwidget/shape/gf_badge_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:hrm_attendance_app/model/guest_model.dart';
import 'package:hrm_attendance_app/model/event_model.dart';
import 'package:hrm_attendance_app/services/database_service.dart';
import 'common/app_colors.dart';
import 'common/app_manager.dart';
import 'common/text_design.dart';
import 'custom_widget/custom_Text.dart';
import 'model/globals.dart';
import 'new_user_view.dart';

class UserView extends StatefulWidget {
  final Event event;
  const UserView( {super.key, required this.event});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  final dbService = DatabaseService();


  List<GuestModel> guest = [];

  bool check = false;

  int selectedId =0;

  GuestModel? model;


  void Init() {
    getEmployeeData();
    setState(() {

    });
  }

  void getEmployeeData() async {
    var resp = await dbService.getGuestListById(widget.event.id);
    guest = resp.data as List<GuestModel>;
    setState(() {
    });
  }

  void updateData()async{
    var resp = await dbService.getGuestListById(widget.event.id);
    guest = resp.data as List<GuestModel>;
    setState(() {
    });
  }

  @override
  void initState() {
    Init();
    Globals.updateAttendance=()=>{
      updateData()
    };
    setState(() {
    });
  }

  void updatelist(BuildContext context,int index) async {
    guest[index].status = check;
    setState(() {
    });
    var response = await dbService.updateGuestStatus(guest[index]);
    if (response.status == "ERROR") {
      print("Error update User");
      defaultErrorMessage("User update ${response.message}");
      return;
    } else {
      defaultSuccessMessage("User update ${response.message}");
    }
    Globals.updateAttendance!();
    Init();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>NewUserView(event: widget.event,)));
          },
          backgroundColor: blueShades2,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blueShades2,
        title: Row(
          children: [
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,color: whiteColor,size: 30,)),
            SizedBox(width: 25,),
            SizedBox(
              width: 15,
            ),
            CustomText(
              customText: widget.event.name.toString().toUpperCase(),
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
        child:
        Column(
          children: [
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomText(
                    customText: "Guest List",
                    customColor: blueShades2,
                    customFontSize: 19,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: guest.length==0?
              CustomText(
                customText: "No Guest found for this Event",
                customColor: Colors.black,
                customFontSize: 14,
              ):ListView.builder(
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
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: 10,top: 10),
                                width: 170,
                                height: 20,
                                child: GFBadge(
                                  child: Text(
                                    guest[index].email,
                                    style: commonDesigns.statusText,
                                  ),
                                  shape: GFBadgeShape.standard,
                                  size: GFSize.LARGE,
                                  color: GFColors.FOCUS,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  customText:guest[index].phone,
                                  customColor: blueShades2,
                                  customFontSize: 14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 20,left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  customText: "Tickets:",
                                  customColor: blueShades2,
                                  customFontSize: 14,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 50,
                                  height: 35,
                                  child: GFBadge(
                                    child: Text(
                                      guest[index].totalTickets.toString(),
                                      style: commonDesigns.statusText,
                                    ),
                                    shape: GFBadgeShape.standard,
                                    size: GFSize.LARGE,
                                    color: GFColors.SECONDARY,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    CustomText(
                                      customText: "Arrived Status:",
                                      customColor: blueShades2,
                                      customFontSize: 14,
                                    ),
                                    guest[index].status==true? Container(
                                      margin: EdgeInsets.only(left: 10),
                                      width: 50,
                                      height: 35,
                                      child: GFBadge(
                                        child: Icon(Icons.done_outline_outlined,color: whiteColor,),
                                        shape: GFBadgeShape.standard,
                                        size: GFSize.LARGE,
                                        color: GFColors.SUCCESS,
                                      ),
                                    ):
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: blueShades2,
                                      value: guest[index].status, onChanged: (bool? value) {
                                        check = value!;
                                         selectedId = index;
                                        setState(() {
                                        });

                                        updatelist(context,selectedId);
                                    },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      )
    );
  }
}
