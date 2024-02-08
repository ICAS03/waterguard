import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/widgets/new_card.dart';
import 'package:waterguard/widgets/payment_card_row.dart';

class paymentScreen extends StatelessWidget {
  const paymentScreen({super.key});
  static const routeName = '/payment';

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
      body: Container(
        padding: EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(
                      color: custom_color.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [const paymentCard()],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => {},
              child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: custom_color.grey,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Text(
                    '+ Add New Card',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: custom_color.black),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            newCard(
              cardName: "MasterCard",
              cardNumber: "********128",
            ),
            SizedBox(
              height: 20,
            ),
            newCard(
              cardName: "MasterCard",
              cardNumber: "********128",
            ),
            Positioned(
                bottom: 20,
                right: 5,
                child: GestureDetector(
                  onTap: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                              color: custom_color.primaryBlue,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            'Donate Now',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: custom_color.backgroundwhite),
                          )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
