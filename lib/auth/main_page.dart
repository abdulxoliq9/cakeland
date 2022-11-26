import 'package:cakeland/sign/signIn.dart';
import 'package:cakeland/pages/home/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static final String id = 'main_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          print(snapshot.hasData);
          if(snapshot.hasData){
            print('result: ${snapshot.hasData}');
            return HomePage();
          }else{
            print('result: ${snapshot.hasData}');
            return SignIn();
          }
        },
      ),
    );
  }
}
