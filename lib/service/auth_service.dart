import 'package:firebase_auth/firebase_auth.dart';
import 'package:logintask/view/homepage.dart';
import 'package:logintask/view/signup_page.dart';

class AuthService{
  FirebaseAuth auth = FirebaseAuth.instance;

  isLoggedIn(){
    if (auth.currentUser == null){
      return SignUpScreen();
    } else return HomePage();
  }
}