import 'package:energy_optimization_and_monitoring_app/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential") {
        return "invalid-credential";
      } else {
        return "error";
      }
    }
  }

  static signUp(
      {required String email,
      required String password,
      required String name,
      required String address,
      required String mobileNo}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        String uid = credential.user!.uid;
        FirebaseServices.addSignUpData(
          uid: uid, // Pass UID here
          email: email,
          name: name,
          address: address,
          mobileNo: mobileNo,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
