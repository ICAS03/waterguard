import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waterguard/screens/create_forum_screen.dart';
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
        title: Text(
          "Community",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
          CommunityCard(
              name: "Heris",
              content: "Major flash flood is hitting KL city",
              datePosted: "@ 1/2/24 15:09:20"),
          Spacer(),
          CommunityCard(
              name: "Han Shin",
              content: "My dog went missing from the flood",
              datePosted: "@ 27/1/24 09:15:03"),
          Spacer(),
          FloatingActionButton(
              backgroundColor: primaryAccent,
              onPressed: () => {
                    Navigator.of(context).pushNamed(CreateNewForum.routeName),
                  },
              child: Icon(
                Icons.add,
                color: backgroundwhite,
              ))
        ]),
      ),
    );
  }
}
