import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class donationHistoryScreen extends StatelessWidget {
  static const routeName = '/donationhistory';
  String imgPath;
  String donationTitle;

  donationHistoryScreen({required this.imgPath, required this.donationTitle});

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
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              imgPath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${donationTitle}',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                Text(
                  'Raised',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: custom_color.primaryAccent),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'RM 13054.69',
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: custom_color.primaryAccent),
                    ),
                  ],
                ),
                Text(
                  'Date 1st February ~ 25th March',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 5,
                  endIndent: 5,
                  color: custom_color.grey,
                ),
                Text(
                  'Impact Record',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                impactRecord(),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => {},
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: custom_color.primaryBlue,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      child: Text(
                        'Download Full Report',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color:
                                custom_color.backgroundwhite.withOpacity(0.8)),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 5,
                  endIndent: 5,
                  color: custom_color.grey,
                ),
                Text(
                  'User Record',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                userReport(
                    amount: 135.00,
                    date: '7/2/2024',
                    paymentmethod: 'Credit Card'),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => {},
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: custom_color.primaryBlue,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      child: Text(
                        'Download Full Report',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color:
                                custom_color.backgroundwhite.withOpacity(0.8)),
                      )),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class impactRecord extends StatefulWidget {
  @override
  State<impactRecord> createState() => _impactRecordState();
}

class _impactRecordState extends State<impactRecord> {
  List<String> impactRecords = [
    '•Food Relief to 130 households',
    '•Building Restore & Repair',
    '•Evacuation Center Operation'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            impactRecords.map((impactRecord) => Text(impactRecord)).toList());
  }
}

class userReport extends StatelessWidget {
  double amount;
  String date;
  String paymentmethod;

  userReport(
      {required this.amount, required this.date, required this.paymentmethod});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Donated ${amount}',
        ),
        Text(
          'Date ${date}',
        ),
        Text(
          'Payment Method ${paymentmethod}',
        ),
      ],
    );
  }
}
