import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterguard/auth_widget_tree.dart';
import 'package:waterguard/models/colors.dart';
import 'package:waterguard/navigation.dart';
import 'package:waterguard/providers/donation_provider.dart';
import 'package:waterguard/providers/flood_provider.dart';
import 'package:waterguard/providers/forum_provider.dart';
import 'package:waterguard/providers/user_provider.dart';
import 'package:waterguard/screens/create_forum_screen.dart';
import 'package:waterguard/screens/donation_history_screen.dart';
import 'package:waterguard/screens/explore_screen.dart';
import 'package:waterguard/screens/last_donation_screen.dart';
import 'package:waterguard/screens/last_volunteer_screen.dart';
import 'package:waterguard/screens/login_screen.dart';
import 'package:waterguard/screens/community_screen.dart';
import 'package:waterguard/screens/community_screen_details.dart';
import 'package:waterguard/screens/donation_screen.dart';
import 'package:waterguard/screens/new_card_screen.dart';
import 'package:waterguard/screens/onBoarding_screen.dart';
import 'package:waterguard/screens/payment_screen.dart';
import 'package:waterguard/screens/register_screen.dart';
import 'package:waterguard/screens/single_donation_screen.dart';
import 'package:waterguard/screens/volunteers_details_screen.dart';
import 'package:waterguard/screens/explore_screen.dart';
import 'models/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: UserProvider(),
          ),
          ChangeNotifierProvider.value(value: ForumProvider()),
          ChangeNotifierProvider.value(value: FloodProvider()),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: backgroundwhite,
              fontFamily: 'Roboto',
            ),
            home: AuthWidgetTree(),
            routes: {
              registerScreen.routeName: (context) => registerScreen(),
              onboardingScreen.routeName: (context) => onboardingScreen(),
              loginScreen.routeName: (context) => loginScreen(),
              paymentScreen.routeName: (context) => paymentScreen(),
              newCardScreen.routeName: (context) => newCardScreen(),
              DonationScreen.routeName: (context) => DonationScreen(),
              volunteerDetailScreen.routeName: (context) =>
                  volunteerDetailScreen(),
              lastVolunteerScreen.routeName: (context) => lastVolunteerScreen(),
              Navigation.routeName: (context) => Navigation(),
              ExploreScreen.routeName: (context) => ExploreScreen(),
              CreateNewForum.routeName: (context) => CreateNewForum(),
            }));
  }
}
