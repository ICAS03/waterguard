import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class paymentCard extends StatefulWidget {
  const paymentCard({Key? key}) : super(key: key);

  @override
  State<paymentCard> createState() => _paymentCardState();
}

class _paymentCardState extends State<paymentCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Box(icon: Icons.credit_card, text: "Credit_Card"),
        Box(icon: Icons.card_membership, text: "Debit_Card"),
        Box(icon: Icons.wallet, text: "E_wallet"),
      ],
    );
  }
}

class Box extends StatefulWidget {
  final IconData icon;
  final String text;

  Box({required this.icon, required this.text});

  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
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
        width: 133,
        height: 125,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isClicked ? custom_color.primaryAccent : custom_color.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon,
                    color: custom_color.backgroundwhite, size: 40),
              ],
            ),
            Text(
              widget.text,
              style: TextStyle(color: custom_color.backgroundwhite),
            ),
          ],
        ),
      ),
    );
  }
}
