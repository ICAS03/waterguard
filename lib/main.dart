import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart';
import 'package:waterguard/screens/login_screen.dart';
import 'package:waterguard/screens/community_screen.dart';
import 'package:waterguard/screens/community_screen_details.dart';
import 'package:waterguard/screens/donation_screen.dart';
import 'package:waterguard/screens/register_screen.dart';
import 'models/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundwhite,
        fontFamily: 'Roboto',
      ),
      home: const registerScreen(),
      routes: {
        registerScreen.routeName: (context) => registerScreen(),
        loginScreen.routeName: (context) => loginScreen()
      },
    );
  }
}
