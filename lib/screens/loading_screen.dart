import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: custom_color.backgroundwhite,
      child: Center(
        child: CircularProgressIndicator(
          color: custom_color.primaryAccent,
        ),
      ),
    );
  }
}
