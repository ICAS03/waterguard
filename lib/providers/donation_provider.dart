import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:waterguard/models/donation_model.dart';
import '../models/forum_model.dart';

class DonationProvider with ChangeNotifier {
  List<String> donationIdList = [];
  List<DonationModel> loadedDonationList = [];

  Future<void>? makeDonation(String content) {
    FirebaseFirestore.instance.collection('user_donation').doc().set(
      {
        "id": '',
        "amount": '',
        'date': '',
        'donationtitle': '',
        'organization': '',
        'paymentmethod': '',
      },
    );
  }

  Future<void> fetchDonationId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection('user_donation').get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (donation) {
              donationIdList.add(donation.reference.id);
            },
          );
        },
      );
      print('Success! fetched donationId List: ${donationIdList}');
    } catch (e) {
      print("error");
      return null;
    }
  }

  Future<void> fetchAllDonationData() async {
    for (int i = 0; i < donationIdList.length; i++) {
      await fetchDonationDataFromId(donationIdList[i]);
    }
    print('all done');
  }

  Future<void> fetchDonationDataFromId(String donationId) async {
    await FirebaseFirestore.instance
        .collection('user_donation')
        .doc(donationId)
        .get()
        .then(
      (snapshot) {
        DonationModel loadedDonation = DonationModel(
          id: snapshot.data()!['id'],
          amount: snapshot.data()!['amount'],
          date: snapshot.data()!['date'],
          organization: snapshot.data()!['organization'],
          donationtitle: snapshot.data()!['donationtitle'],
          paymentMethod: snapshot.data()!['paymentmethod'],
        );
        loadedDonationList.add(loadedDonation);
        print('fetched ${snapshot.data()!['donationtitle']}');
      },
    );
  }
}
