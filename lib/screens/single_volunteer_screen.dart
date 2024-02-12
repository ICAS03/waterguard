import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/screens/volunteers_details_screen.dart';

import '../widgets/single_volunteer_card.dart';

class singleVolunteerScreen extends StatelessWidget {
  String imgPath;
  String volunteerTitle;
  String organization;
  String location;
  String date;
  String floodvictims;

  singleVolunteerScreen(
      {required this.imgPath,
      required this.volunteerTitle,
      required this.date,
      required this.floodvictims,
      required this.location,
      required this.organization});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_color.secondaryYellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.search))],
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              upperVolunteerCard(
                  imgPath: imgPath,
                  volunteerTitle: volunteerTitle,
                  date: date,
                  floodvictims: floodvictims,
                  location: location,
                  organization: organization),
              Divider(
                height: 10,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: custom_color.grey,
              ),
              singleVolunteerCard(
                  description:
                      'In the wake of the devastating floods that have submerged communities across the region, the Red Cross Malaysia urgently calls upon dedicated and skilled medical professionals to join our humanitarian efforts, providing crucial assistance to flood victims in their time of dire need, as we strive together to alleviate suffering, offer medical care, and bring hope to those grappling with the aftermath of this natural disaster.',
                  aboutus:
                      'The Red Cross Society of Malaysia, commonly known as the Malaysian Red Crescent Society, stands as a beacon of compassion and humanitarianism, embodying the principles of neutrality, impartiality, and humanity in its mission to alleviate human suffering. Established in 1948, the organization has played a pivotal role in responding to emergencies, disasters, and crises, both domestically and internationally. With a dedicated team of volunteers and professionals, the Red Cross Malaysia tirelessly works to provide ',
                  contact: '017-2101203',
                  email: 'm_rc@gmail.com')
            ],
          ),
        ),
        Positioned(
            bottom: 20,
            right: 5,
            child: GestureDetector(
              onTap: () => {
                Navigator.of(context)
                    .pushNamed(volunteerDetailScreen.routeName),
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                          color: custom_color.primaryBlue,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      child: Text(
                        'Donate Now',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: custom_color.backgroundwhite),
                      )),
                ],
              ),
            ))
      ]),
    );
  }
}

class upperVolunteerCard extends StatelessWidget {
  String imgPath;
  String volunteerTitle;
  String organization;
  String location;
  String date;
  String floodvictims;

  upperVolunteerCard(
      {required this.imgPath,
      required this.volunteerTitle,
      required this.date,
      required this.floodvictims,
      required this.location,
      required this.organization});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          child: Image.asset(
            imgPath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(13.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  volunteerTitle,
                  style: TextStyle(
                    color: custom_color.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text(
              "by ${organization}",
              style: TextStyle(
                color: custom_color.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Location: ${location}',
                style: TextStyle(
                    color: custom_color.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 15,
            ),
            Text('Date: ${date}',
                style: TextStyle(
                    color: custom_color.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 15,
            ),
            Text('Estimated Flood Victims: ${floodvictims}',
                style: TextStyle(
                    color: custom_color.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
          ]),
        ),
      ],
    ));
  }
}
