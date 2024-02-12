import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class lastVolunteerScreen extends StatelessWidget {
  const lastVolunteerScreen({super.key});
  static const routeName = '/lastvolunteer';

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
        body: Center(
          child: Container(
              height: 355,
              width: 355,
              decoration: BoxDecoration(
                color: custom_color.backgroundwhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: custom_color.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('lib/assets/images/charity.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'THANK YOU FOR JOINING US',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: custom_color.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Your help is very much appreciated',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: custom_color.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //this is not done//
                  Text(
                    'by Malaysia Red Crescent',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: custom_color.black),
                  )
                ],
              )),
        ));
  }
}
