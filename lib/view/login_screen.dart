import 'package:flutter/material.dart';
import 'package:logintask/service/firebase_api.dart';
import 'package:logintask/view/signup_page.dart';

import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text("Please login to continue", style: TextStyle(fontSize: 20),),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "email"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "password"
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async{
                  if(email.text.isNotEmpty && password.text.isNotEmpty){
                    await FirebaseApi().signIn(email.text, password.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("oops login failed")));
                  }


                },
                child: Text("login"),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Text("Don't have an account"),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                    child: Text("signUp"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
