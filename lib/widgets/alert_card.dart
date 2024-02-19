import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class alertCard extends StatelessWidget {
  String datetime;
  String location;
  double waterdepth;
  String risklevel;
  String evacuationcentre;
  String affectedroads;

  alertCard(
      {required this.datetime,
      required this.location,
      required this.waterdepth,
      required this.risklevel,
      required this.evacuationcentre,
      required this.affectedroads});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        builder: (_, scrollController) => Container(
            decoration: BoxDecoration(
                color: custom_color.primaryAccent,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.crisis_alert_rounded,
                          size: 32,
                          color: custom_color.secondaryYellow,
                        ),
                      ),
                      Text(
                        'ALERT : FLOOD WARNING',
                        style: TextStyle(
                            color: custom_color.secondaryYellow,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Text(
                    'Stay Away From Flood',
                    style: TextStyle(
                        color: custom_color.backgroundwhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date/Time : ${datetime}",
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
                        "Water Depth : ${waterdepth}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Risk Level: ${risklevel}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Nearby Evacuation Centre: ${evacuationcentre}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: custom_color.backgroundwhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Affected Roads : ${affectedroads}",
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
