import 'package:flutter/material.dart';
import '../models/colors.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class CreateNewForumCategory extends StatelessWidget {
  IconData icon;
  String text;
  CreateNewForumCategory(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            child: Icon(
              icon,
              size: 25,
              color: custom_color.backgroundwhite,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: custom_color.backgroundwhite,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
