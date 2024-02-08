import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class paymentCard extends StatelessWidget {
  const paymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () => {}, child: Box(Icons.credit_card, "Credit_Card")),
        GestureDetector(
          onTap: () => {},
          child: Box(Icons.card_membership, "Debit_Card"),
        ),
        GestureDetector(
          onTap: () => {},
          child: Box(Icons.wallet, "E_wallet"),
        ),
      ],
    );
  }
}

Widget Box(icon, text) {
  return Container(
      child: Column(
    children: [
      Container(
          width: 133,
          height: 125,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: custom_color.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: custom_color.backgroundwhite, size: 40),
                ],
              ),
              Text(
                text,
                style: TextStyle(color: custom_color.backgroundwhite),
              ),
            ],
          )),
    ],
  ));
}
