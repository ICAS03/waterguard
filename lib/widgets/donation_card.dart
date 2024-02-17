import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waterguard/models/colors.dart';
import 'package:waterguard/screens/single_donation_screen.dart';

class DonationCard extends StatelessWidget {
  String imgPath;
  String donationTitle;
  String organizations;
  double currentAmount;
  double targetAmount;

  DonationCard(
      {required this.imgPath,
      required this.donationTitle,
      required this.organizations,
      required this.currentAmount,
      required this.targetAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 140,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            child: Container(
              width: 107,
              height: double.infinity,
              child: Image(
                image: AssetImage(imgPath),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            width: 192,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${donationTitle}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "by ${organizations}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                LinearProgressIndicator(
                  value: currentAmount / targetAmount,
                  color: secondaryYellow,
                  backgroundColor: primaryAccent,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "RM ${currentAmount} / ${targetAmount}",
                  style: TextStyle(fontSize: 12),
                ),
                Spacer(),
                // Change the ontap later
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => singleDonationScreen(
                        imgPath: imgPath,
                        donationTitle: donationTitle,
                        organizations: organizations,
                        currentAmount: currentAmount,
                        targetAmount: targetAmount,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Donate Now",
                        style: TextStyle(fontSize: 12),
                      ),
                      Icon(Icons.arrow_right_alt_outlined)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
