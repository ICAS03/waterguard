import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommunityCard extends StatelessWidget {
  String name;
  // later change to datetime
  String datePosted;
  String content;
  CommunityCard(
      {required this.name, required this.content, required this.datePosted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blueAccent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  // change this to the image
                  Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.account_circle_rounded,
                          size: 50, color: Colors.grey)),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        datePosted,
                        style: TextStyle(color: Colors.white.withOpacity(0.4)),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                content,
                style: TextStyle(color: Colors.white),
              )
            ]),
          ),
          Container(
            width: 360,
            height: 40,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 213, 1),
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(20),
                    bottomEnd: Radius.circular(20))),
            child: EngagementPost(),
          )
        ],
      ),
    );
  }
}

class EngagementPost extends StatelessWidget {
  const EngagementPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // xde likes icons
        Icon(Icons.message),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.share),
        Spacer(),
        GestureDetector(onTap: () => {}, child: Text("View All Comments"))
      ],
    );
  }
}
