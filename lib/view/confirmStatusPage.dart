import 'dart:collection';

import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/Trip_Data_model.dart';
import 'package:travel_app/model/user_data_model.dart';
import 'package:travel_app/view/widgets/confirmStatusWidget.dart';

import '../model/tripBookingStatus.dart';
class ConfirmStatusPage extends StatefulWidget {
   ConfirmStatusPage({required this.listofTrips,required this.listofUsers,required this.tripBookingStatus,
     // required this.update
   });
UnmodifiableListView<TripDataModel> listofTrips;
  UnmodifiableListView<UserDataModel> listofUsers;
   UnmodifiableListView<TripBookingStatus>?  tripBookingStatus ;
   // VoidCallback update;

   @override
  State<ConfirmStatusPage> createState() => _ConfirmStatusPageState();
}

class _ConfirmStatusPageState extends State<ConfirmStatusPage> {
  update(){
    setState(() {
print("done");
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final appBarHeight =appBar.preferredSize.height;
    final statusBar = MediaQuery.of(context).padding.top;
    //  final intialHight=screenHeight-appBarHeight-statusBar;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff01404f),
      ),
      body: Container(
        child:widget.tripBookingStatus==null?Center(
          child:   Container(
            padding: EdgeInsets.only(top: screenHeight*0.03),
            alignment: Alignment.center,
            child: Text(
              " لا يوجد رحلات محجوزه",
              style: TextStyle(
                  color: Color(0xff002134),
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ) :ListView(
          children:
            widget.tripBookingStatus!.map((e) {
              return e.status=="تم الطلب"? ConfirmStatusWidget(trip: widget.listofTrips.firstWhere((trip) => e.TripId==trip.id)
                  , user: widget.listofUsers.firstWhere((user) => e.UserId==user.DatabaseId), statusId: e.TripBookingStatusid!,
                  update:update
              ):Container();
            }).toList()
          ,
        ),
      ),
    );
  }
}
