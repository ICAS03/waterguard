import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterguard/providers/user_provider.dart';
import 'package:waterguard/screens/onBoarding_screen.dart';
import 'auth.dart';
import 'models/user_model.dart';
import 'navigation.dart';

class AuthWidgetTree extends StatefulWidget {
  const AuthWidgetTree({super.key});

  @override
  State<AuthWidgetTree> createState() => _AuthWidgetTreeState();
}

class _AuthWidgetTreeState extends State<AuthWidgetTree> {
  @override
  Widget build(BuildContext context) {
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Navigation();
        } else {
          return onboardingScreen();
        }
      },
    );
  }
}
