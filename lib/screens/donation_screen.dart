import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waterguard/widgets/donation_card.dart';
import 'package:waterguard/widgets/volunteers_card.dart';
import '../models/colors.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({super.key});
  static const routeName = '/maindonation';

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryYellow,
        title: Text(
          "Donation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TotalDonationCard(
              imgPath: 'lib/assets/images/gold_donation.png',
              amount: 20,
              volunteer: 1,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  fillColor: backgroundwhite,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  hintText: "Search for..",
                  suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 20,
            ),
            DonationCard(
              imgPath: "lib/assets/photos/donation-1.png",
              currentAmount: 5907.34,
              donationTitle: "Flood Relief Campaign - Penang",
              organizations: "Share.99",
              targetAmount: 10000.00,
            ),
            SizedBox(
              height: 20,
            ),
            DonationCard(
              imgPath: "lib/assets/photos/donation-2.png",
              currentAmount: 4920.12,
              donationTitle: "Flood Donation Drive - Selangor",
              organizations: "UTAR",
              targetAmount: 10000.00,
            ),
            SizedBox(
              height: 20,
            ),
            DonationCard(
              imgPath: "lib/assets/photos/donation-3.png",
              currentAmount: 39403.12,
              donationTitle: "Malaysia Flood Relief Fund - Terrenganu",
              organizations: "PKSM",
              targetAmount: 70000.00,
            ),
            Text(
              "Volunteers",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            VolunteersCard(
              imgPath: "lib/assets/photos/volunteers-1.png",
              position: "Medics",
              organizations: "Malaysia Red Crescent",
              location: "Port Klang, Selangor",
              description:
                  "In response to the devastating floods that have wreaked havoc on communities, displacing families...",
            ),
          ]),
        ),
      ),
    );
  }
}

class TotalDonationCard extends StatelessWidget {
  int amount;
  String imgPath;
  int volunteer;

  TotalDonationCard(
      {required this.amount, required this.imgPath, required this.volunteer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      width: 360,
      height: 136,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Color(0XFF037EF3).withOpacity(0.88),
            Color(0xFF00009E).withOpacity(0.88)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Row(children: [
        Image(image: AssetImage(imgPath)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gold Contributor",
              style: TextStyle(
                  color: secondaryYellow,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Donated : RM ${amount}",
              style: TextStyle(
                  color: backgroundwhite,
                  fontSize: 23,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "Voluntered: ${volunteer}",
              style: TextStyle(
                  color: backgroundwhite,
                  fontSize: 23,
                  fontWeight: FontWeight.w400),
            ),
            /* GestureDetector(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  "History",
                  style: TextStyle(fontSize: 12),
                ),
                Icon(Icons.double_arrow_outlined)
              ]),
            ),*/
          ],
        ),
      ]),
    );
  }
}
