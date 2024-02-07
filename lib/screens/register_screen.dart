import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/screens/login_screen.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});
  static const routeName = '/register';

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  String errorMessage = '';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 75, right: 170),
              child: Column(children: [
                Row(children: [
                  GestureDetector(
                    onTap: () => {Navigator.of(context).pop()},
                    child: Icon(Icons.keyboard_arrow_left_rounded,
                        color: custom_color.black, size: 50),
                  ),
                ]),
                Container(
                  margin: const EdgeInsets.only(left: 28),
                  child: Text("CREATE AN ACCOUNT",
                      style: TextStyle(
                          color: custom_color.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold)),
                ),
              ]),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(33),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                        color: custom_color.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter Email Address",
                          fillColor: custom_color.grey)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                        color: custom_color.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      textInputAction: TextInputAction.next,
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter Password",
                          fillColor: custom_color.grey)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                        color: custom_color.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter phone number",
                          fillColor: custom_color.grey)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Address",
                    style: TextStyle(
                        color: custom_color.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter house address",
                          fillColor: custom_color.grey)),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: _errorMessage(),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(loginScreen.routeName),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: custom_color.primaryBlue,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: custom_color.backgroundwhite
                                  .withOpacity(0.8)),
                        )),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Error? $errorMessage',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: custom_color.primaryAccent,
          fontSize: 14,
          fontWeight: FontWeight.w600),
    );
  }
}
