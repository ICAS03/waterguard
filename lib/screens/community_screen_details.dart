import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/colors.dart';

class CommunityScreenDetails extends StatelessWidget {
  const CommunityScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryYellow,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
    );
  }
}
