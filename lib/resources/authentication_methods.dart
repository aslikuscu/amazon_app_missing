import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Authenticationmethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<String> signUpUser(
      {required String name,
      required String adress,
      required String email,
      required String password}) async {
    name.trim();
    adress.trim();
    email.trim();
    password.trim();
    String output = " something went wrong";
    if (name != "" && adress != " " && email != " " && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        output = " success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "please fill up all the field";
    }
    return output;
  }
}
