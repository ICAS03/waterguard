import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;
import 'package:waterguard/screens/login_screen.dart';
import 'package:waterguard/screens/register_screen.dart';
import 'package:waterguard/widgets/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboardingScreen extends StatefulWidget {
  const onboardingScreen({super.key});

  @override
  State<onboardingScreen> createState() => _onboardingState();
}

int currentPage = 1;

class _onboardingState extends State<onboardingScreen> {
  final _controller = PageController();

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    int previousPage = page;
    if (page != 0)
      previousPage--;
    else
      previousPage = 2;
    print("Previous page: $previousPage");
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          bottom: 30,
        ),
        height: double.infinity,
        width: double.infinity,
        color: custom_color.backgroundwhite,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 580,
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: PageView(
                    onPageChanged: (page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    controller: _controller,
                    children: [
                      welcomeCard(
                        imageUrl: 'lib/assets/images/WaterGuard.png',
                        title: "Let's Get Started",
                        description:
                            "A flood alerting app that creates a safer community",
                      ),
                      welcomeCard(
                        imageUrl: 'lib/assets/images/WaterGuard.png',
                        title: "Flood Emergency",
                        description:
                            "A flood alerting app that creates a safer community",
                      ),
                      welcomeCard(
                        imageUrl: 'lib/assets/images/WaterGuard.png',
                        title: "Donation Drive",
                        description:
                            "A flood alerting app that creates a safer community",
                      ),
                    ],
                  )),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(20),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      onDotClicked: (index) {
                        _controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 12,
                        activeDotColor: custom_color.secondaryYellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(33),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(registerScreen.routeName),
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: custom_color.primaryBlue,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: custom_color.backgroundwhite
                                    .withOpacity(0.8)),
                          )),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(loginScreen.routeName),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: custom_color.grey,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: custom_color.primaryBlue.withOpacity(0.8)),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
