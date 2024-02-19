import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterguard/auth.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/models/user_model.dart';
import 'package:waterguard/providers/user_provider.dart';
import 'package:waterguard/widgets/donation_history_card.dart';

class profileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _profileScreen createState() => _profileScreen();
}

class _profileScreen extends State<profileScreen> {
  bool isHovered = false;

  UserModel userProviderData = UserModel(
    id: '', // Initialize with the desired value
    name: '', // Initialize with the desired value
    email: '',
    phone: '',
    address: '',
  );

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  fetchUserData() async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .get()
        .then(
      (snapshot) {
        setState(() {
          userProviderData.address = snapshot.data()!['address'];
          userProviderData.email = snapshot.data()!['email'];
          userProviderData.id = snapshot.data()!['id'];
          userProviderData.name = snapshot.data()!['name'];
          userProviderData.phone = snapshot.data()!['phone'];
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_color.secondaryYellow,
        title: Text(
          "History",
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.account_circle_rounded,
                        color: Colors.grey, size: 60)),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      'Good Evening , ',
                      style: TextStyle(color: custom_color.black, fontSize: 25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${userProviderData.name}",
                          style: TextStyle(
                              color: custom_color.black, fontSize: 25),
                        ),
                        Icon(Icons.edit_outlined)
                      ],
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            TotalDonationCard(
              current_contributor: "Gold Contributor",
              amount: 8000,
              imgPath: 'lib/assets/images/gold_icon.png',
              next_contributor: "Platinum Contributor",
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => {
                setState(() => {
                      isHovered = !isHovered,
                    })
              },
              child: Text(
                "Download Certificate >> ",
                // ignore: dead_code
                style: TextStyle(
                  fontSize: 14,
                  color: custom_color.primaryAccent,
                  decoration: isHovered
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Donation History',
                  style: TextStyle(
                      color: custom_color.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            donationHistoryCard(
                imgPath: 'lib/assets/photos/donation-1.png',
                donationTitle: 'Flood Relief Campaign - Penang',
                organizations: "Share99",
                amount: 135,
                date: "7/2/2024"),
            SizedBox(
              height: 20,
            ),
            donationHistoryCard(
                imgPath: 'lib/assets/photos/donation-4.png',
                donationTitle: 'Malaysia Flood Relief Fund',
                organizations: "PKSM",
                amount: 50,
                date: "2/1/2024"),
            SizedBox(
              height: 20,
            ),
            donationHistoryCard(
                imgPath: 'lib/assets/photos/donation-5.png',
                donationTitle: 'Flood Relief Campaign - Klang',
                organizations: "TMNH",
                amount: 20,
                date: "25/1/2024"),
          ],
        ),
      ),
    );
  }
}

class TotalDonationCard extends StatelessWidget {
  double amount;
  String imgPath;
  String next_contributor;
  String current_contributor;

  TotalDonationCard(
      {required this.amount,
      required this.imgPath,
      required this.next_contributor,
      required this.current_contributor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      width: 354,
      height: 257,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Color(0XFF037EF3).withOpacity(0.88),
            Color(0xFF00009E).withOpacity(0.88)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.topCenter,
              height: 127,
              width: 188,
              child: Image(image: AssetImage(imgPath))),
          Text(
            '${current_contributor}',
            style: TextStyle(color: custom_color.secondaryYellow, fontSize: 25),
          ),
          Text(
            'Donate more ${amount} to',
            style: TextStyle(color: custom_color.backgroundwhite, fontSize: 15),
          ),
          Text(
            'Next: ${next_contributor}',
            style: TextStyle(color: custom_color.backgroundwhite, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
