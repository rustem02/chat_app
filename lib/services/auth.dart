import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> login(String email, String pass) async{
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);

      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception();
    }
  }
  Future<UserCredential> register(String email, String pass) async{
    try{
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);

      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async{
    return await FirebaseAuth.instance.signOut();
  }
}