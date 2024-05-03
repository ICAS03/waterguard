import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterguard/auth_widget_tree.dart';
import 'package:waterguard/controllers%20/notification_controller.dart';
import 'package:waterguard/models/colors.dart';
import 'package:waterguard/navigation.dart';
import 'package:waterguard/providers/donation_provider.dart';
import 'package:waterguard/providers/flood_provider.dart';
import 'package:waterguard/providers/forum_provider.dart';
import 'package:waterguard/providers/realtimeflood_provider.dart';
import 'package:waterguard/providers/update_flood_provider.dart';
import 'package:waterguard/providers/user_provider.dart';
import 'package:waterguard/screens/create_forum_screen.dart';
import 'package:waterguard/screens/discover_screen.dart';
import 'package:waterguard/screens/donation_history_screen.dart';
import 'package:waterguard/screens/explore_screen.dart';
import 'package:waterguard/screens/last_donation_screen.dart';
import 'package:waterguard/screens/last_volunteer_screen.dart';
import 'package:waterguard/screens/login_screen.dart';
import 'package:waterguard/screens/community_screen.dart';
import 'package:waterguard/screens/donation_screen.dart';
import 'package:waterguard/screens/new_card_screen.dart';
import 'package:waterguard/screens/onBoarding_screen.dart';
import 'package:waterguard/screens/payment_screen.dart';
import 'package:waterguard/screens/register_screen.dart';
import 'package:waterguard/screens/searching_screen.dart';
import 'package:waterguard/screens/single_donation_screen.dart';
import 'package:waterguard/screens/volunteers_details_screen.dart';
import 'package:waterguard/screens/explore_screen.dart';
import 'models/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AwesomeNotifications().initialize(
  // set the icon to null if you want to use the default app icon
  // 'resource://drawable/res_app_icon',
  null,
  [
    NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white)
  ],
  // Channel groups are only visual and are not required
  channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group',
        channelGroupName: 'Basic group')
  ],
  debug: true
);
AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  if (!isAllowed) {
    // This is just a basic example. For real apps, you must show some
    // friendly dialog box before call the request method.
    // This is very important to not harm the user experience
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
});
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
        onActionReceivedMethod:         NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod
    );

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: UserProvider()),
          ChangeNotifierProvider.value(value: UpdateFloodProvider()),
          ChangeNotifierProvider.value(value: ForumProvider()),
          ChangeNotifierProvider.value(value: FloodProvider()),
          ChangeNotifierProvider.value(value: realtimeflood_provider()),
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
              SearchingScreen.routeName: (context) => SearchingScreen(),
              DiscoverScreen.routeName: (context) => DiscoverScreen(),
              CreateNewForum.routeName: (context) => CreateNewForum(),
            }));
  }
}
