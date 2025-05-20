import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  static Future<void> addSignUpData({
    required String email,
    required String name,
    required String address,
    required String mobileNo,
    required String uid, // NEW
  }) async {
    CollectionReference userCollectionReference =
        FirebaseFirestore.instance.collection('users');

    await userCollectionReference.doc(uid).set({
      "email": email,
      "name": name,
      "address": address,
      "mobile-number": mobileNo
    });
  }

  // New method to update garage door state
  static Future<void> updateGarageDoorState(String newState) async {
    final garageDoc =
        FirebaseFirestore.instance.collection('settings').doc('garageDoor');
    await garageDoc.set({'state': newState}, SetOptions(merge: true));
  }
}
