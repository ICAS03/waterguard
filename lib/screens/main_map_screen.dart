import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/widgets/alert_card.dart';
import 'package:waterguard/widgets/evacuation_card.dart';
import 'package:waterguard/widgets/map_card.dart';
import 'package:waterguard/widgets/menu_card.dart';

class mainMapScreen extends StatefulWidget {
  static const routeName = '/mainmap';

  State<mainMapScreen> createState() => _mainMapScreenState();
}

class _mainMapScreenState extends State<mainMapScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance
        .addPostFrameCallback((_) => _showAwarenessDialog());
  }

  void _showAwarenessDialog() {
    showDialog(context: context, builder: (context) => awarenessDialog());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: custom_color.secondaryYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          title: Container(
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Indicator Monitor'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                          image: AssetImage(
                              'lib/assets/images/green_indicator.png')),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                          image: AssetImage(
                              'lib/assets/images/blue_indicator.png')),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                          image: AssetImage(
                              'lib/assets/images/yellow_indicator.png')),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                          image: AssetImage(
                              'lib/assets/images/red_indicator.png')),
                    ),
                  ],
                )
              ],
            ),
          ),
          actions: [
            IconButton(
                onPressed: () => {
                      showModalBottomSheet(
                          isDismissible: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => alertCard(
                              datetime: "7/2/2024 13:00:24",
                              location: "Subang Jaya , Selangor",
                              waterdepth: 155.00,
                              risklevel: "Dangerous",
                              evacuationcentre: "SMK USJ 12",
                              affectedroads: "Jalan USJ 12/1 , Jalan USJ 13/4"))
                    },
                icon: Icon(
                  Icons.notifications_active_rounded,
                  color: custom_color.backgroundwhite.withOpacity(0.1),
                ))
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            mapCard(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 13.0),
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                  onTap: () => showModalBottomSheet(
                      isDismissible: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => menuCard()),
                  child: Icon(Icons.list_alt_outlined)),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 13.0),
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                  onTap: () => showModalBottomSheet(
                      isDismissible: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => evacuationCard(
                          centrename: "SMK USJ 12",
                          location: "Subang Jaya , Selangor",
                          currentCapacity: 150,
                          currentStatus: "Full",
                          saferoutes: "Jalan USJ 4/5 , Jalan USJ 4/10")),
                  child: Icon(Icons.pin_drop_outlined)),
            ),
          ],
        ));
  }
}

class awarenessDialog extends StatelessWidget {
  const awarenessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: custom_color.primaryBlue,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        width: 390,
        height: 515,
        padding: EdgeInsets.all(13.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            'FLOOD SAFETY',
            style: TextStyle(
                fontSize: 20,
                color: custom_color.backgroundwhite,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'RULES',
            style: TextStyle(
                fontSize: 20,
                color: custom_color.backgroundwhite,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.crisis_alert_rounded,
                      size: 45,
                      color: custom_color.backgroundwhite,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pay attention to announcements',
                        style: TextStyle(
                            color: custom_color.backgroundwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Keep yourself updated on this application',
                        style: TextStyle(
                            color: custom_color.backgroundwhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.bolt_rounded,
                      size: 45,
                      color: custom_color.backgroundwhite,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stay Away From Electronics',
                        style: TextStyle(
                            color: custom_color.backgroundwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Turn Off Gas And Power',
                        style: TextStyle(
                            color: custom_color.backgroundwhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.directions_run_rounded,
                      size: 45,
                      color: custom_color.backgroundwhite,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Relocate to higher ground',
                        style: TextStyle(
                            color: custom_color.backgroundwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Keep valuable items at higher level',
                        style: TextStyle(
                            color: custom_color.backgroundwhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.car_crash_rounded,
                      size: 45,
                      color: custom_color.backgroundwhite,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abandon your vehicle',
                        style: TextStyle(
                            color: custom_color.backgroundwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Do not drive in flooded water',
                        style: TextStyle(
                            color: custom_color.backgroundwhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.flood_rounded,
                      size: 45,
                      color: custom_color.backgroundwhite,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Do not swim/play in flooded water',
                        style: TextStyle(
                            color: custom_color.backgroundwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Evacuate to safer routes',
                        style: TextStyle(
                            color: custom_color.backgroundwhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    ]);
  }
}
