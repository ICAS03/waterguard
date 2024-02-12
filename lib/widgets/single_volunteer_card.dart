import 'package:flutter/cupertino.dart';

class singleVolunteerCard extends StatelessWidget {
  String description;
  String aboutus;
  String contact;
  String email;

  singleVolunteerCard(
      {required this.description,
      required this.aboutus,
      required this.contact,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(
          children: [
            Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Text(
          description,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "About Us",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(
          aboutus,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(
          'Contact No: ${contact}',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
        ),
        Text(
          'Email: ${email}',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
        )
      ]),
    );
  }
}
