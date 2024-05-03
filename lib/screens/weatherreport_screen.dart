import 'package:flutter/material.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class WeatherReportScreen extends StatefulWidget {
  static const routeName = '/weatherReport';

  @override
  _WeatherReportScreenState createState() => _WeatherReportScreenState();
}

class _WeatherReportScreenState extends State<WeatherReportScreen> {
  String selectedWeather = '';
  bool hasFlood = false;
  bool isSelected = false;

  void selectWeather(String weather) {
    setState(() {
      selectedWeather = weather;
    });
  }

  void selectFlood(bool isFlood) {
    setState(() {
      hasFlood = isFlood;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 213, 1),
          title: Text(
            "Report",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.search))],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.wb_twighlight,
                            color: custom_color.primaryBlue,
                          ),
                          Column(children: [
                            Container(
                              width: 305,
                              child: Text(
                                'Our water level sensor detected unusual rise of water level in your area.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                          ])
                        ],
                      ),
                      Divider(thickness: 1.0),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'What is the weather now?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OptionButton(
                              icon: Icons.sunny,
                              text: "Clear Sky",
                              isSelected: selectedWeather == 'Clear Sky',
                              onPressed: {isSelected}),
                          OptionButton(
                              icon: Icons.cloud,
                              text: "Cloudy",
                              isSelected: selectedWeather == 'Cloudy',
                              onPressed: {}),
                          OptionButton(
                            icon: Icons.bolt,
                            text: 'Thunderstorm',
                            isSelected: selectedWeather == 'Thunderstorm',
                            onPressed: {},
                          ),
                          OptionButton(
                            icon: Icons.water_drop,
                            text: 'Light Rain',
                            isSelected: selectedWeather == 'Light Rain',
                            onPressed: {},
                          ),
                          SizedBox(height: 10.0),
                          Divider(thickness: 1.0),
                          SizedBox(height: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Signs Of Flood?',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  OptionButton2(
                                      isFlood: false, details: "Test"),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: custom_color.primaryBlue,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'POST',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: custom_color.backgroundwhite
                                              .withOpacity(0.8)),
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ])),
          ),
        ));
  }
}

//option button//
class OptionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final void onPressed;

  const OptionButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isSelected
        ? custom_color.primaryBlue
        : const Color.fromRGBO(238, 238, 238, 1);
    return TextButton(
      onPressed: () => {},
      style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Text(
            text,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}

class OptionButton2 extends StatelessWidget {
  final bool isFlood;
  final String details;

  const OptionButton2({Key? key, required this.isFlood, required this.details});

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isFlood
        ? custom_color.primaryBlue
        : const Color.fromRGBO(238, 238, 238, 1);
    return Container(
      child: Column(
        children: [
          TextButton(
            onPressed: () => {},
            style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: isFlood ? Colors.white : Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Text(
                  'No Flood',
                  style: TextStyle(
                      fontSize: 16,
                      color: isFlood ? Colors.white : Colors.black),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () => {},
            style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.flood_rounded,
                      color: isFlood ? Colors.white : Colors.red,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    Text(
                      'Flood',
                      style: TextStyle(
                          fontSize: 16,
                          color: isFlood ? Colors.white : Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  width: 500,
                  child: TextField(
                      maxLines: 5,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter Details",
                          fillColor: custom_color.grey)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
