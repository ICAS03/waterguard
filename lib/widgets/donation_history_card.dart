import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waterguard/models/colors.dart';
import 'package:waterguard/screens/donation_history_screen.dart';
import 'package:waterguard/screens/single_donation_screen.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class donationHistoryCard extends StatelessWidget {
  String imgPath;
  String donationTitle;
  String organizations;
  double amount;
  String date;

  donationHistoryCard(
      {required this.imgPath,
      required this.donationTitle,
      required this.organizations,
      required this.amount,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 150,
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
              height: 140,
              child: Image(
                image: AssetImage(imgPath),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            width: 220,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
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
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      "Donated ",
                      style: TextStyle(
                          color: custom_color.primaryAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "RM${amount}",
                      style: TextStyle(
                        color: custom_color.primaryAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Text(
                  "Date = ${date}",
                  style: TextStyle(
                      fontSize: 15,
                      color: custom_color.primaryAccent,
                      fontWeight: FontWeight.w600),
                ),

                // Change the ontap later
                GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => donationHistoryScreen(
                              imgPath: imgPath,
                              donationTitle: donationTitle,
                            )))
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "View More",
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
