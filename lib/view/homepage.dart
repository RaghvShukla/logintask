import 'package:flutter/material.dart';
import 'package:logintask/service/firebase_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text("Welcome", style: TextStyle(fontSize: 24)),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: (){
                FirebaseApi().logout(context);
              },
              child: Text("logout"),
            )
          ],
        ),
      ),
    );
  }
}
