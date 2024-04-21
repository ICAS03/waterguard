import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:waterguard/auth.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/navigation.dart';
import 'package:waterguard/screens/register_screen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});
  static const routeName = '/login';

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String errorMessage = '';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  child: Text("WELCOME BACK",
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
                    "Email :",
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
                    "Password :",
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
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: ()  => {
                      signInWithEmailAndPassword(),
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: custom_color.primaryBlue,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: custom_color.backgroundwhite
                                  .withOpacity(0.8)),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Forgot Password ?",
                      style: (TextStyle(
                        fontWeight: FontWeight.w200,
                        color: custom_color.black.withOpacity(0.5),
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      " OR ",
                      style: (TextStyle(
                          color: custom_color.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Don't Have An Account ?",
                        style: TextStyle(
                            color: custom_color.primaryAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.of(context)
                                .pushNamed(registerScreen.routeName)
                          },
                          child: Text(
                            "Sign Up",
                            style: (TextStyle(
                              color:
                                  custom_color.primaryAccent.withOpacity(0.9),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            )),
                          ),
                        ),
                      ),
                    ],
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
      errorMessage == '' ? '' : 'Incorrect? $errorMessage',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: custom_color.primaryAccent,
          fontSize: 14,
          fontWeight: FontWeight.w600),
    );
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth()
          .signInWithEmailAndPassword(
            emailController.text,
            passwordController.text,
          )
          .then((value) =>
              {Navigator.of(context).pushNamed(Navigation.routeName)});
    } on FirebaseAuthException catch (e) {
      setState(
        () {
          errorMessage = e.message!;
        },
      );
    }
  }
}
