import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterguard/providers/user_provider.dart';
import 'package:waterguard/screens/community_screen.dart';
import 'package:waterguard/screens/donation_screen.dart';
import 'package:waterguard/screens/explore_screen.dart';
import 'package:waterguard/screens/loading_screen.dart';
import 'package:waterguard/screens/main_map_screen.dart';
import 'package:waterguard/screens/profile_screen.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/screens/weatherreport_screen.dart';

class Navigation extends StatefulWidget {
  static const routeName = '/navigation';

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  static GlobalKey<_NavigationState> globalKey =
      new GlobalKey<_NavigationState>();

  BottomNavigationBar get navigationBar {
    return _NavigationState.globalKey.currentWidget as BottomNavigationBar;
  }

  int currentIndex = 2;
  bool _isLoading = true;

  List<Widget> screens = [
    DonationScreen(),
    WeatherReportScreen(),
    mainMapScreen(),
    CommunityScreen(),
    profileScreen(),
  ];

  @override
  initState() {
    Provider.of<UserProvider>(context, listen: false).fetchUserData().then(
      (_) {
        setState(
          () {
            _isLoading = false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double navBarIconSize = 32;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: custom_color.primaryBlue,
      body: _isLoading ? LoadingScreen() : screens[currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: custom_color.primaryBlue,
            selectedItemColor: custom_color.primaryAccent,
            unselectedItemColor: custom_color.backgroundwhite,
            currentIndex: currentIndex,
            onTap: (int newIndex) {
              setState(() {
                currentIndex = newIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.handshake_rounded,
                  size: navBarIconSize,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.feedback_rounded,
                  size: navBarIconSize,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.home_rounded,
                  size: navBarIconSize,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.person_pin_rounded,
                  size: navBarIconSize,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.person_rounded,
                  size: navBarIconSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
