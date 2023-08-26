import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:travel_app/controller/userController.dart';
import 'package:travel_app/model/tripBookingStatus.dart';
import 'package:travel_app/model/user_data_model.dart';
import 'package:travel_app/view/AddNewItem.dart';
import 'package:travel_app/view/traelsDetails_page.dart';
import 'package:travel_app/view/updatePage.dart';
import 'package:travel_app/view/widgets/trips%20Card.dart';

import '../controller/glopal data repo.dart';
import '../controller/sendEmailController.dart';
import '../model/Trip_Data_model.dart';
import 'confirmStatusPage.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  void initState() {
    // SendEmailController.sendEmailFunc('abdelrhmannassr8511111@gmail.com',"$idNumb $name $phoneNumb ");
    // TODO: implement initState
    setState(() {
      UserController().Log_out_with_timer(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UnmodifiableListView<TripDataModel>>(
        initialData: UnmodifiableListView<TripDataModel>([]),
        stream: bloc.TRipsStream,
        builder: (context, tripssnapshot) {
          return StreamBuilder<UnmodifiableListView<UserDataModel>>(
              initialData: UnmodifiableListView<UserDataModel>([]),
              stream: bloc.UserStream,
              builder: (context, Uerssnapshot) {
                return StreamBuilder<UnmodifiableListView<TripBookingStatus>>(
                    // initialData: UnmodifiableListView<TripBookingStatus>([]),
                    stream: bloc.trip_booking_Data_Stream,
                    builder: (context, TripBookingStatussnapshot) {
                      return Scaffold(
                          appBar: AppBar(
                            backgroundColor: Color(0xff01404f),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff01404f)),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => ConfirmStatusPage(
                                                  listofTrips:
                                                      tripssnapshot.data!,
                                                  tripBookingStatus:
                                                  TripBookingStatussnapshot.data,
                                                  listofUsers: Uerssnapshot.data!,
                                              // update: (){
                                              //       setState(() {
                                              //
                                              //
                                              //       });
                                              //       print("done ");
                                              // },
                                                )));
                                  },
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          floatingActionButton: FloatingActionButton(
                            backgroundColor: Color(0xff01404f),
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => AddNewItem()));
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          body: RefreshIndicator(
                            onRefresh: () async {
                              await bloc.getData_trip();
                              print("expiresIn${expiresIn}");
                            },
                            child: ListView.builder(
                              itemBuilder: (context, count) {
                                return TipsCard(
                                    snapShot: tripssnapshot, count: count);
                              },
                              itemCount: tripssnapshot.data!.length,
                            ),
                          ));
                    });
              });
        });
  }
}
