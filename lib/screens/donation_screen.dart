import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waterguard/widgets/donation_card.dart';
import 'package:waterguard/widgets/volunteers_card.dart';
import '../models/colors.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({super.key});

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
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TotalDonationCard(
              amount: 20,
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
                  "In response to the devastating floods that have wreaked havoc on communities, displacing families ",
            )
          ]),
        ),
      ),
    );
  }
}

class TotalDonationCard extends StatelessWidget {
  int amount;
  TotalDonationCard({
    required this.amount,
  });

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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "You Donated",
          style: TextStyle(
              color: backgroundwhite,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(
              "Total: ",
              style: TextStyle(
                  color: backgroundwhite,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "RM ${amount}.00",
              style: TextStyle(
                  color: backgroundwhite,
                  fontSize: 44,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ]),
    );
  }
}
