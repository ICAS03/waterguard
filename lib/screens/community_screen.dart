import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waterguard/widgets/community_card.dart';
import '../models/colors.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});
  static const routeName = '/community';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 213, 1),
        title: Text("Community"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.search))],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          CommunityCard(
              name: "Jeremy Theng",
              content: "IOI Puchong Mall is flooding right now",
              datePosted: "@ 2/2/24 14:11:25"),
          Spacer(),
          FloatingActionButton(
              backgroundColor: primaryAccent,
              onPressed: () => {},
              child: Icon(
                Icons.add,
                color: backgroundwhite,
              ))
        ]),
      ),
    );
  }
}
