import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/screens/payment_screen.dart';

class newCardScreen extends StatefulWidget {
  const newCardScreen({super.key});
  static const routeName = '/addnewcard';

  @override
  State<newCardScreen> createState() => _newCardScreenState();
}

class _newCardScreenState extends State<newCardScreen> {
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
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
        body: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(13.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    'Add New Card',
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
              Text(
                'Card Name',
                style: TextStyle(fontSize: 20, color: custom_color.black),
              ),
              TextField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      filled: true,
                      contentPadding: const EdgeInsets.all(15),
                      hintText: "Example : John Doe",
                      fillColor: custom_color.backgroundwhite)),
              Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: custom_color.black,
              ),
              Text(
                'Card Number',
                style: TextStyle(fontSize: 20, color: custom_color.black),
              ),
              TextField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      filled: true,
                      contentPadding: const EdgeInsets.all(15),
                      hintText: "Example : *******128",
                      fillColor: custom_color.backgroundwhite)),
              Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: custom_color.black,
              ),
              Text(
                'CVV',
                style: TextStyle(fontSize: 20, color: custom_color.black),
              ),
              TextField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      filled: true,
                      contentPadding: const EdgeInsets.all(15),
                      hintText: "Example : 480",
                      fillColor: custom_color.backgroundwhite)),
              Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: custom_color.black,
              ),
              Container(
                  child: donateButton(
                text: 'Donate Now',
                onClicked: () =>
                    Navigator.of(context).pushNamed(paymentScreen.routeName),
              ))
            ]),
          ),
        ));
  }

  Widget donateButton(
          {required String text, required VoidCallback onClicked}) =>
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: custom_color.primaryBlue),
          onPressed: onClicked,
          child: Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: 50,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: custom_color.backgroundwhite,
                ),
              ),
            ),
          ));
}
