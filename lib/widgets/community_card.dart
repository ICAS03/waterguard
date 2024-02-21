import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/colors.dart';

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
          borderRadius: BorderRadius.circular(20), color: primaryBlue),
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
                            color: backgroundwhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        datePosted,
                        style:
                            TextStyle(color: backgroundwhite.withOpacity(0.4)),
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
                style: TextStyle(color: backgroundwhite),
              )
            ]),
          ),
          Container(
            width: 360,
            height: 40,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
                color: secondaryYellow,
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(20),
                    bottomEnd: Radius.circular(20))),
            child: EngagementPost(
              numOfComments: 20,
              numOfLikes: 20,
            ),
          )
        ],
      ),
    );
  }
}

class EngagementPost extends StatelessWidget {
  int numOfLikes;
  int numOfComments;
  EngagementPost({required this.numOfLikes, required this.numOfComments});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(numOfLikes.toString()),
        SizedBox(
          width: 8,
        ),
        Icon(Icons.favorite),
        SizedBox(
          width: 12,
        ),
        Text(numOfComments.toString()),
        SizedBox(
          width: 8,
        ),
        Icon(Icons.message),
        SizedBox(
          width: 8,
        ),
        Icon(
          Icons.share,
        ),
        Spacer(),
        GestureDetector(
            // Change the on tap to Navigator.pushNamed later
            onTap: () => {},
            child: Text(
              "View All Comments",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ))
      ],
    );
  }
}
