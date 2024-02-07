import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waterguard/models/colors.dart';

class VolunteersCard extends StatelessWidget {
  String imgPath;
  String position;
  String organizations;
  String location;
  String description;
  VolunteersCard(
      {required this.imgPath,
      required this.position,
      required this.organizations,
      required this.location,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundwhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Image(
            height: 120,
            image: AssetImage(imgPath),
          ),
        ),
        Divider(
          color: Colors.black,
        ),
        Container(
          width: 360,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${organizations} - ${position} NEEDED",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Location: ${location}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                textAlign: TextAlign.justify,
                "Description: ${description}",
              ),
              SizedBox(
                height: 8,
              ),
              // Change the ontap later
              GestureDetector(
                onTap: () => {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Join Now",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_right_alt_outlined,
                      size: 28,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
