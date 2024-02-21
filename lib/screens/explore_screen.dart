import 'package:flutter/material.dart';
import 'package:waterguard/screens/discover_screen.dart';
import 'package:waterguard/screens/searching_screen.dart';
import '../models/colors.dart';
// import 'package:adhoc_plugin/adhoc_plugin.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});
  static const routeName = '/mainexplore';

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // TransferManager _manager = TransferManager(false);

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
                  // _listen();
                  Navigator.of(context).pushNamed(SearchingScreen.routeName);
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
                  // _listen();
                  Navigator.of(context).pushNamed(DiscoverScreen.routeName);
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

  // void _listen() {
  //   _manager.eventStream.listen((event) {
  //     switch (event.type) {
  //       case AdHocType.onDeviceDiscovered:
  //         var device = event.device as AdHocDevice;
  //         break;
  //       case AdHocType.onDiscoveryStarted:
  //         break;
  //       case AdHocType.onDiscoveryCompleted:
  //         var discovered = event.data as Map<String?, AdHocDevice?>;
  //         break;
  //       case AdHocType.onDataReceived:
  //         var data = event.data as Object;
  //         break;
  //       case AdHocType.onForwardData:
  //         var data = event.data as Object;
  //         break;
  //       case AdHocType.onConnection:
  //         var device = event.device as AdHocDevice;
  //         break;
  //       case AdHocType.onConnectionClosed:
  //         var device = event.device as AdHocDevice;
  //         break;
  //       case AdHocType.onInternalException:
  //         var exception = event.data as Exception;
  //         break;
  //       case AdHocType.onGroupInfo:
  //         var info = event.data as int;
  //         break;
  //       case AdHocType.onGroupDataReceived:
  //         var data = event.data as Object;
  //         break;
  //       default:
  //         print("its running _listen");
  //     }
  //   });
  // }
}
