import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/screens/payment_screen.dart';
import 'package:waterguard/widgets/single_donation_card.dart';

class singleDonationScreen extends StatelessWidget {
  String imgPath;
  String donationTitle;
  String organizations;
  double currentAmount;
  double targetAmount;

  singleDonationScreen(
      {required this.imgPath,
      required this.donationTitle,
      required this.organizations,
      required this.currentAmount,
      required this.targetAmount});

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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              donationTitle,
                              style: TextStyle(
                                color: custom_color.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "by ${organizations}",
                          style: TextStyle(
                            color: custom_color.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        LinearProgressIndicator(
                          value: currentAmount / targetAmount,
                          color: custom_color.secondaryYellow,
                          backgroundColor: custom_color.primaryAccent,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "RM ${currentAmount} / ${targetAmount}",
                          style: TextStyle(fontSize: 12),
                        )
                      ]),
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: custom_color.grey,
                ),
                singleDonationCard(
                    description:
                        "In response to the devastating floods that have wreaked havoc on communities, displacing families and causing widespread destruction, Share99 are launching a comprehensive flood relief campaign aimed at providing immediate assistance and long-term support to the victims. Your generous donations will play a pivotal role in offering essential relief supplies, including clean water, food, shelter, and medical aid, to those affected by the calamity, ensuring their basic needs are met during this challenging time. Moreover, the funds raised will contribute to the reconstruction of damaged infrastructure, homes, and schools, facilitating the restoration of normalcy in the lives of flood victims. ",
                    aboutus:
                        "Share99, where compassion meets innovation, and together, we embark on a mission to uplift communities affected by natural disasters. Founded on the principle that sharing can be a powerful force for good, Share99 is more than an organization; it's a beacon of hope for those facing the aftermath of floods and other calamities. In the wake of devastating floods, Share99 stands as a pillar of support, dedicating its resources to providing immediate relief and long-term assistance to the victims. Our dynamic team, comprising disaster response experts, humanitarian aid workers, and community development specialists, collaborates tirelessly to ensure that the impact of the floods is mitigated, and affected individuals can rebuild their lives.",
                    contact: "017-8392019",
                    email: "share99@gmail.com")
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => {
                Navigator.of(context).pushNamed(paymentScreen.routeName),
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
            ),
          )
        ],
      ),
    );
  }
}
