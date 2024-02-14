import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class lastdonationScreen extends StatelessWidget {
  static const routeName = '/lastdonation';
  String amount;

  lastdonationScreen({required this.amount});

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
              margin: EdgeInsets.all(13.0),
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
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('lib/assets/images/charity.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'YOU DONATED',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: custom_color.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 90,
                    width: 318,
                    decoration: BoxDecoration(
                        color: custom_color.secondaryYellow,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${amount}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: custom_color.backgroundwhite),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //this is not done//
                  Text(
                    'by Share99 sdn.bhd',
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
