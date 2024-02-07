import 'package:flutter/cupertino.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});
  static const routeName = '/login';

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Login"),
    );
  }
}
