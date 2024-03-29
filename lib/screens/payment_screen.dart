import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/screens/last_donation_screen.dart';
import 'package:waterguard/screens/new_card_screen.dart';
import 'package:waterguard/widgets/new_card.dart';
import 'package:waterguard/widgets/payment_card_row.dart';

class paymentScreen extends StatefulWidget {
  const paymentScreen({super.key});
  static const routeName = '/payment';

  @override
  State<paymentScreen> createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen> {
  String selectedAmount = "";
  final TextEditingController amountController = TextEditingController();
  bool isClicked = false;
  bool isClickedInSheet = false;
  bool isClickedButton1 = false;
  bool isClickedButton2 = false;
  bool isClickedButton3 = false;

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
      body: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.all(13.0),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [paymentCard()],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.of(context).pushNamed(newCardScreen.routeName),
                  setState(() => {isClicked = !isClicked})
                },
                child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: isClicked
                            ? custom_color.primaryAccent
                            : custom_color.grey),
                    alignment: Alignment.center,
                    child: Text(
                      '+ Add New Card',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isClicked
                              ? custom_color.backgroundwhite
                              : custom_color.black),
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
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: donateButton(
                      text: 'Donate Now',
                      onClicked: () => showBottomSheet(
                          context: context,
                          builder: (context) => buildSheet())))
            ],
          ),
        ),
      ),
    );
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

  Widget makeDismissable({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () => {},
          child: child,
        ),
      );

  Widget buildSheet() => makeDismissable(
      child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.5,
          builder: (_, scrollController) => Container(
                decoration: BoxDecoration(
                    color: custom_color.primaryBlue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                padding: EdgeInsets.all(15.0),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Text(
                      'How Much To Donate ?',
                      style: TextStyle(
                          color: custom_color.backgroundwhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => {
                        onDonateAmountSelected('RM 50', isClickedButton1),
                        setState(() => isClickedButton1 = !isClickedButton1)
                      },
                      child: Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                              color: custom_color.backgroundwhite,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            'RM 50',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: isClickedButton1
                                    ? custom_color.primaryAccent
                                    : custom_color.black),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => {
                        onDonateAmountSelected('RM 100', isClickedButton2),
                        setState(() => isClickedButton2 = !isClickedButton2)
                      },
                      child: Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                              color: custom_color.backgroundwhite,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            'RM 100',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: isClickedButton2
                                    ? custom_color.primaryAccent
                                    : custom_color.black),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => {
                        onDonateAmountSelected('RM 150', isClickedButton3),
                        setState(() => isClickedButton3 = !isClickedButton3)
                      },
                      child: Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                              color: custom_color.backgroundwhite,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            'RM 150',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: isClickedButton3
                                    ? custom_color.primaryAccent
                                    : custom_color.black),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        " OR ",
                        style: (TextStyle(
                            color: custom_color.backgroundwhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                        textInputAction: TextInputAction.next,
                        controller: amountController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: custom_color.black, strokeAlign: 1)),
                            filled: true,
                            contentPadding: const EdgeInsets.all(15),
                            hintText: "Enter Amount",
                            fillColor: custom_color.backgroundwhite)),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => {
                        handleDonation(),
                      },
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: custom_color.backgroundwhite,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            'Donate Now',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: custom_color.primaryAccent
                                    .withOpacity(0.8)),
                          )),
                    ),
                  ],
                ),
              )));

  void onDonateAmountSelected(String amount, bool isClicked) {
    setState(() {
      selectedAmount = amount;
      isClickedInSheet = isClicked;
    });
  }

  void handleDonation() {
    if (selectedAmount.isNotEmpty || amountController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => lastdonationScreen(
              amount: selectedAmount.isNotEmpty
                  ? selectedAmount
                  : amountController.text),
        ),
      );
    } else {}
  }
}
