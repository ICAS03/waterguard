import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/models/flood_model.dart';
import 'package:waterguard/widgets/details_card.dart';

class menuCard extends StatefulWidget {
  @override
  State<menuCard> createState() => _menuCardState();
}

class _menuCardState extends State<menuCard> {
  List<FloodModel> floods = [
    FloodModel(
        location: "Port Klang , Selangor", time: "12.11pm", waterlevel: 153),
    FloodModel(
        location: "Subang Jaya , Selangor", time: "9.15pm", waterlevel: 156),
    FloodModel(
        location: "Kelana Jaya , Selangor", time: "8.33pm", waterlevel: 154),
    FloodModel(
        location: "Tunku Othman , Terrenganu",
        time: "16.23pm",
        waterlevel: 139),
    FloodModel(
        location: "Bangsar , Kuala Lumpur", time: "14.03pm", waterlevel: 142),
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        builder: (_, scrollController) => Container(
              decoration: BoxDecoration(
                  color: custom_color.primaryBlue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              padding: EdgeInsets.all(13.0),
              child: ListView.builder(
                controller: scrollController,
                itemCount: floods.length,
                itemBuilder: (context, index) {
                  final flood = floods[index];
                  return ListTile(
                    leading: Text(
                      flood.time,
                      style: TextStyle(
                          fontSize: 25,
                          color: custom_color.backgroundwhite,
                          fontWeight: FontWeight.w600),
                    ),
                    title: Text(
                      flood.location,
                      style: TextStyle(
                          fontSize: 20,
                          color: custom_color.backgroundwhite,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Water Depth : ${flood.waterlevel} cm',
                      style: TextStyle(
                          fontSize: 20,
                          color: custom_color.secondaryYellow,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () => {
                      showModalBottomSheet(
                          isDismissible: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => detailsCard(flood: flood))
                    },
                  );
                },
              ),
            ));
  }
}
