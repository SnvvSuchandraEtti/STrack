import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String email, String password, String name, String rollNo) async {
    try {
      // Create user in Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // Add user details to Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': name,
        'rollNo': rollNo,
        'email': email,
      });
    } catch (e) {
      print(e); // Handle errors appropriately
    }
  }
}
