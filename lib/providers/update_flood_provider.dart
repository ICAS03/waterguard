import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/flood_model.dart';
import 'package:waterguard/models/realflood_model.dart';
import '../auth.dart';

class UpdateFloodProvider with ChangeNotifier {
  List<String> floodList = [];
  List<RealFloodModel> loadedFloodList = [];

  Future<void> setFloodData(
      String userid, String username, int waterlevel, String location) async {
    await FirebaseFirestore.instance
        .collection('realtimeflood')
        .doc(Auth().currentUser!.uid)
        .set(
      {
        "userid": userid,
        "username": username,
        "waterlevel": waterlevel,
        "location": location,
      },
    );
  }

  Future<void> updateWaterLvl(int waterlevel) async {
    await FirebaseFirestore.instance
        .collection('realtimeflood')
        .doc(Auth().currentUser!.uid)
        .update({"waterlevel": waterlevel});
    print("Updated waterlevel");
  }

  Future<void> fetchFloodId() async {
    print('fetch');
    try {
      String userId = Auth().currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('realtimeflood')
          .doc(userId) // Use current user's ID as document ID
          .get()
          .then(
        (snapshot) {
          if (snapshot.exists) {
            floodList.add(snapshot.reference.id);
            print('Success! fetched floodId: ${snapshot.reference.id}');
          } else {
            print('No flood data found for user ID: $userId');
          }
        },
      );
    } catch (e) {
      print("error: $e");
    }
  }

  Future<void> fetchAllFloodData() async {
    for (int i = 0; i < floodList.length; i++) {
      await fetchFloodDataFromId(floodList[i]);
    }
    print('all done');
  }

   Future<void> fetchFloodDataFromId(String userId) async {
    await FirebaseFirestore.instance
        .collection('realtimeflood')
        .doc(userId)
        .get()
        .then(
      (snapshot) {
        RealFloodModel loadedFloodModel = RealFloodModel(
          userid: snapshot.data()!['userid'],
          username: snapshot.data()!['username'],
          waterlevel: snapshot.data()!['waterlevel'],
          location: snapshot.data()!['location'],
        );
        loadedFloodList.add(loadedFloodModel);
        print('fetched flood data');
      },
    );
  }


  /*Future<void> fetchFloodId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection('realtimeflood').get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (flood) {
              floodList.add(flood.reference.id);
            },
          );
        },
      );
      print('Success! fetched floodId List: ${floodList}');
    } catch (e) {
      print("error");
      return null;
    }
  }

  Future<void> fetchAllFloodData() async {
    for (int i = 0; i < floodList.length; i++) {
      await fetchFloodDataFromId(floodList[i]);
    }
    print('all done');
  }

  Future<void> fetchFloodDataFromId(String floodList) async {
    await FirebaseFirestore.instance
        .collection('realtimeflood')
        .doc(Auth().currentUser!.uid)
        .get()
        .then(
      (snapshot) {
        RealFloodModel loadedFloodModel = RealFloodModel(
          userid: snapshot.data()!['userid'],
          username: snapshot.data()!['username'],
          waterlevel: snapshot.data()!['waterlevel'],
          location: snapshot.data()!['location'],
        );
        loadedFloodList.add(loadedFloodModel);
        print('fetched flood data');
      },
    );
  }

  Future<String?> fetchRealTimeFloodLoc() async {
    print('fetch');
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('realtimeflood')
          .doc(Auth().currentUser!.uid)
          .get();
      String ? location = snapshot.data()?['location'];
      print('Success');
       return location;
    } catch (e) {
      print("error");
      return null;
    }
  }*/
}
