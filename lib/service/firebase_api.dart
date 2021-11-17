import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logintask/view/login_screen.dart';

class FirebaseApi{

  Future<User?> signUp(String email, String password) async{
    UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    User? user = credential.user;
    return user;
  }

  Future<User?> signIn(String email, String password) async{
    UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    User? user = credential.user;
    return user;
  }

  logout(BuildContext context) async{
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

}