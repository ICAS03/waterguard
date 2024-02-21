import 'package:flutter/material.dart';
import 'package:waterguard/screens/explore_screen.dart';
import '../models/colors.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});
  static const routeName = '/exploreDiscover';

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  var internetAccess = "Online";
  var broadcastStatus = "Success";
  var broadcastInterval = 5;

  @override
  void initState() {
    super.initState();
  }

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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Internet Acess:\n\nBroadcast Status:\n\nBroadcast Interval:"),
                  SizedBox(width: 50),
                  Text(
                    internetAccess +
                        "\n\n" +
                        broadcastStatus +
                        "\n\n" +
                        broadcastInterval.toString() +
                        " minutes",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ExploreScreen.routeName);
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
                    'Stop Broadcasting',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: backgroundwhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
