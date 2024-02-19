import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  UserModel userProviderData = UserModel(
    id: '', // Initialize with the desired value
    name: '', // Initialize with the desired value
    email: '',
    phone: '',
    address: '',
  );

  Future<void> setName(String name) async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({'name': name});
    print('Done name');
  }

  Future<void> setPhone(String phone) async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"phone": phone});
    print('Done phone');
  }

  Future<void> setAddress(String address) async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({'address': address});
    print('Done address');
  }

  Future<void> fetchUserData() async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .get()
        .then(
      (snapshot) {
        userProviderData.address = snapshot.data()!['address'];
        userProviderData.email = snapshot.data()!['email'];
        userProviderData.id = snapshot.data()!['id'];
        userProviderData.name = snapshot.data()!['name'];
        userProviderData.phone = snapshot.data()!['phone'];
      },
    );
  }
}
