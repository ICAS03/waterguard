import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/screens/airtag_screen.dart';
import 'package:waterguard/screens/community_screen.dart';
import 'package:waterguard/screens/donation_screen.dart';
import 'package:waterguard/screens/main_map_screen.dart';
import 'package:waterguard/screens/profile_screen.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  static GlobalKey<_NavigationState> globalKey =
      new GlobalKey<_NavigationState>();

  BottomNavigationBar get navigationBar {
    return _NavigationState.globalKey.currentWidget as BottomNavigationBar;
  }

  int currentIndex = 0;
  bool _isLoading = true;

  List<Widget> screens = [
    mainMapScreen(),
    airtagScreen(),
    DonationScreen(),
    CommunityScreen(),
    profileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    double NavBarIconSize = 32;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: custom_color.primaryBlue,
      floatingActionButton: Container(
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: currentIndex == 2
              ? custom_color.primaryAccent
              : custom_color.backgroundwhite,
          onPressed: () => navigationBar.onTap!(2),
          child: Icon(
            Icons.navigation_rounded,
            size: NavBarIconSize,
            color: custom_color.backgroundwhite,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[currentIndex],
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
              topLeft: Radius.circular(28), topRight: Radius.circular(28)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: custom_color.primaryBlue,
            selectedItemColor: custom_color.primaryAccent,
            unselectedItemColor: custom_color.backgroundwhite,
            key: globalKey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
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
                    Icons.home_rounded,
                    size: NavBarIconSize,
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.person_pin_circle_rounded,
                    size: NavBarIconSize,
                  )),
              const BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.navigation_rounded,
                  size: 0,
                ),
              ),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.handshake_rounded,
                    size: NavBarIconSize,
                  )),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.person_rounded,
                  size: NavBarIconSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
