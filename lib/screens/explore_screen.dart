import 'package:flutter/material.dart';
import 'package:waterguard/widgets/payment_card_row.dart';
import '../models/colors.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  static const routeName = '/mainexplore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryYellow,
        title: Text(
          "Lost & Find",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 32, color: black),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.search))],
      ),
      body: Container(
        decoration: BoxDecoration(color: backgroundwhite),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    20), // Use BorderRadius.circular() directly
              ),
              child: Center(
                child: ClipRRect(
                  // Use ClipRRect to apply the rounded corners to the child
                  borderRadius: BorderRadius.circular(
                      20), // Use the same BorderRadius for ClipRRect
                  child: Image(
                    image: AssetImage("lib/assets/photos/map_sample.png"),
                    fit: BoxFit.cover, // Adjust the fit of the image as needed
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
                child: Text(
              "Searching Status : Online",
              style: TextStyle(color: black, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () {
                  // Add your onPressed callback function here
                  // This function will be called when the button is pressed
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      primaryBlue), // Set background color
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Set border radius
                  )),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: backgroundwhite,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
                child: Text(
              "Broadcast location in: 8 minutes",
              style: TextStyle(color: black, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 5),
            Container(
              height: 60,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () {
                  // Add your onPressed callback function here
                  // This function will be called when the button is pressed
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      primaryBlue), // Set background color
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Set border radius
                  )),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Rescue Me!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: secondaryYellow,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
