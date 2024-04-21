import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



class realtimeflood_provider with ChangeNotifier {
  int water_level = 0;

  /*Future<void> fetchRealTimeFlood() async {
    print('fetch');
    try {
      final snapshot = await FirebaseDatabase.instance.ref('WaterLvl').get();
      water_level = int.parse(snapshot.child('us_data').value.toString());

      print('Success! ${water_level}');
    } catch (e) {
      print("error");
      return null;
    }
  }*/

  void listenToRealTimeFlood() {
    FirebaseDatabase.instance.ref('WaterLvl').onValue.listen((event) {
      if (event.snapshot.exists) {
        water_level =
            int.parse(event.snapshot.child('us_data').value.toString());
        notifyListeners(); // Notify listeners of the change
      }
    });
  }


}
