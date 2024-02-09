import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class newCard extends StatefulWidget {
  final String cardName;
  final String cardNumber;

  newCard({required this.cardName, required this.cardNumber});

  @override
  _newCardState createState() => _newCardState();
}

class _newCardState extends State<newCard> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: isClicked ? custom_color.primaryAccent : custom_color.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.cardName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: isClicked
                        ? custom_color.backgroundwhite
                        : custom_color.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.cardNumber,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isClicked
                    ? custom_color.backgroundwhite
                    : custom_color.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
