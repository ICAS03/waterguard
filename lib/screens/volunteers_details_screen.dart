import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/screens/last_donation_screen.dart';
import 'package:waterguard/screens/last_volunteer_screen.dart';
import 'package:waterguard/widgets/payment_card_row.dart';

class volunteerDetailScreen extends StatelessWidget {
  static const routeName = '/volunteerdetail';

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
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: Text('Fill In Your Details',
                  style: TextStyle(
                      color: custom_color.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),
            detailForm(),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => {
                Navigator.of(context).pushNamed(lastVolunteerScreen.routeName),
              },
              child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: custom_color.primaryBlue,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: custom_color.backgroundwhite.withOpacity(0.8)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class detailForm extends StatefulWidget {
  const detailForm({super.key});

  @override
  State<detailForm> createState() => _detailFormState();
}

class _detailFormState extends State<detailForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController icController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: TextStyle(
                color: custom_color.black,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              textInputAction: TextInputAction.next,
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Enter Name",
                  fillColor: custom_color.grey)),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Email",
            style: TextStyle(
                color: custom_color.black,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              textInputAction: TextInputAction.next,
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Enter Email",
                  fillColor: custom_color.grey)),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Phone Number",
            style: TextStyle(
                color: custom_color.black,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              textInputAction: TextInputAction.next,
              controller: contactController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Enter phone number",
                  fillColor: custom_color.grey)),
          const SizedBox(
            height: 20,
          ),
          Text(
            "License Of Certificate (Medics only)",
            style: TextStyle(
                color: custom_color.black,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: custom_color.grey),
            child: Text(
              'Upload Files',
              style: TextStyle(
                color: custom_color.backgroundwhite,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "IC / Passport No.",
            style: TextStyle(
                color: custom_color.black,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              textInputAction: TextInputAction.next,
              controller: contactController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Enter IC/Passport",
                  fillColor: custom_color.grey)),
        ],
      ),
    );
  }
}
