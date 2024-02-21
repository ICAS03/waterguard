import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/flood_model.dart';
import '../models/forum_model.dart';

class FloodProvider with ChangeNotifier {
  List<String> floodIdList = [];
  List<FloodModel> loadedFloodList = [];

  Future<void> fetchFloodId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection('flood').get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (flood) {
              floodIdList.add(flood.reference.id);
            },
          );
        },
      );
      print('Success! fetched floodId List: ${floodIdList}');
    } catch (e) {
      print("error");
      return null;
    }
  }

  Future<void> fetchAllFloodData() async {
    for (int i = 0; i < floodIdList.length; i++) {
      await fetchFloodDataFromId(floodIdList[i]);
    }
    print('all done');
  }

  Future<void> fetchFloodDataFromId(String floodId) async {
    await FirebaseFirestore.instance
        .collection('flood')
        .doc(floodId)
        .get()
        .then(
      (snapshot) {
        FloodModel loadedFlood = FloodModel(
          id: snapshot.data()!['id'],
          time: snapshot.data()!['time'],
          location: snapshot.data()!['location'],
          waterlevel: snapshot.data()!['waterlevel'],
          risklevel: snapshot.data()!['risklevel'],
          evacuationcentre: snapshot.data()!['evacuationcentre'],
          affectedroads: snapshot.data()!['affectedroads'],
        );
        loadedFloodList.add(loadedFlood);
        print('fetched ${snapshot.data()!['id']}');
      },
    );
  }
}
