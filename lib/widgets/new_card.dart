import 'package:flutter/cupertino.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class newCard extends StatelessWidget {
  String cardName;
  String cardNumber;

  newCard({required this.cardName, required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: custom_color.grey, borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cardName,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: custom_color.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              cardNumber,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: custom_color.black),
            ),
          ],
        ),
      ),
    );
  }
}
