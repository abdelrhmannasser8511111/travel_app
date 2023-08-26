import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/Trip_Data_model.dart';
import 'package:travel_app/model/user_data_model.dart';

import '../../controller/glopal data repo.dart';

class ConfirmStatusWidget extends StatefulWidget {
  ConfirmStatusWidget(
      {required this.trip,
      required this.user,
      required this.statusId,
      required this.update});

  TripDataModel trip;
  UserDataModel user;
  String statusId;
  VoidCallback update;

  @override
  State<ConfirmStatusWidget> createState() => _ConfirmStatusWidgetState();
}

class _ConfirmStatusWidgetState extends State<ConfirmStatusWidget> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final appBarHeight =appBar.preferredSize.height;
    final statusBar = MediaQuery.of(context).padding.top;
    //  final intialHight=screenHeight-appBarHeight-statusBar;
    return Container(
        height: screenHeight * 0.35,
        width: double.infinity,
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.25,
                    width: screenWidth * 0.95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'User name :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.05),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${widget.user.name}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.05),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'phone Number :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.05),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${widget.user.phoneNumber}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.05),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'user ID :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.05),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${widget.user.idNumb}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.05),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'trip name :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.05),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${widget.trip.name}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.05),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'trip cost :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.05),
                              ),
                            ),
                            Container(
                              child: Text(
                                '\$ ${widget.trip.price}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.05),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.084,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      bloc
                          .sendTripStatus(
                          userId: widget.user.DatabaseId!,
                          tripstatusId: widget.statusId,
                          tripId: widget.trip.id!)
                          .then((value) {
                        setState(() {
                          bloc.getData_trip();

                          widget.update();
                          //bloc.getTripStatus()
                          // bloc.getData_trip();
                        });
                      } );

                    });



                  },
                  color: Colors.yellow,
                  child: Text(
                    'تأكيد التواصل مع العميل وتأكيد الحجز',
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth * 0.05),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
