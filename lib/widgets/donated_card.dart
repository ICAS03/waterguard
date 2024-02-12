import 'package:flutter/cupertino.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class donatedCard extends StatelessWidget {
  int amount;
  String organization;

  donatedCard({required this.amount, required this.organization});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(13.0),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: custom_color.backgroundwhite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(0)),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset('lib/assets/images/solidarity.png'),
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
              decoration: BoxDecoration(
                  color: custom_color.secondaryYellow,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  Text(
                    'RM ${amount}',
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
            Text(
              'by ${organization}',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: custom_color.black),
            )
          ],
        ));
  }
}
