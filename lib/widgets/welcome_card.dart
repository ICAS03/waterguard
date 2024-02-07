import 'package:flutter/cupertino.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:flutter/material.dart';

class welcomeCard extends StatelessWidget {
  String imageUrl;
  String title;
  String description;

  welcomeCard(
      {required this.imageUrl, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 580,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Color(0xff00009e), Color(0xff037ef3)],
          )),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Text(
            "WaterGuard",
            style: TextStyle(
                color: custom_color.secondaryYellow,
                fontSize: 28,
                fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          child: Image.asset(imageUrl),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
              color: custom_color.backgroundwhite,
              fontSize: 25,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: TextStyle(
              color: custom_color.backgroundwhite,
              fontSize: 13,
              fontWeight: FontWeight.w200),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
