import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class evacuationCard extends StatelessWidget {
  String location;
  int currentCapacity;
  String currentStatus;
  String saferoutes;
  String centrename;

  evacuationCard(
      {required this.location,
      required this.currentCapacity,
      required this.currentStatus,
      required this.saferoutes,
      required this.centrename});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        builder: (_, scrollController) => Container(
            decoration: BoxDecoration(
                color: custom_color.primaryAccent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: EdgeInsets.all(15.0),
            child: Container(
              padding: EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.pin_drop_outlined,
                          size: 32,
                          color: custom_color.backgroundwhite,
                        ),
                      ),
                      Text(
                        'EVACUATION CENTRE ',
                        style: TextStyle(
                            color: custom_color.secondaryYellow,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Text(
                    '${centrename}',
                    style: TextStyle(
                        color: custom_color.secondaryYellow,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current Capacity : ${currentCapacity}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Current Status : ${currentStatus}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Location : ${location}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Safe Routes : ${saferoutes}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
