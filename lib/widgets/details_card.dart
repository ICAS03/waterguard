import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/models/flood_model.dart';

class detailsCard extends StatelessWidget {
  final FloodModel flood;

  const detailsCard({
    Key? key,
    required this.flood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        builder: (_, scrollController) => Container(
            decoration: BoxDecoration(
                color: custom_color.primaryBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: EdgeInsets.all(15.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 30,
                        color: custom_color.backgroundwhite,
                      ),
                      Text(
                        'Detailed Information',
                        style: TextStyle(
                            color: custom_color.secondaryYellow,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date/Time : ${flood.time}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Location : ${flood.location}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Water Depth : ${flood.waterlevel}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Risk Level: Dangerous",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Nearby Evacuation Centre: SMK USJ 13",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Affected Roads : Jalan USJ 4/2 , Jalan USJ 4/10",
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
