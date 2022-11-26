import 'package:cakeland/sign/forgtotPWpage.dart';
import 'package:cakeland/sign/signIn.dart';
import 'package:cakeland/sign/signUp.dart';
import 'package:cakeland/pages/basket/basket.dart';
import 'package:cakeland/pages/home/homePage.dart';
import 'package:cakeland/auth/main_page.dart';
import 'package:cakeland/pages/settingPage/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
        routes: {
        HomePage.id: (context) => HomePage(),
        BasketPage.id: (context) => BasketPage(),
        SettingPage.id: (context) => SettingPage(),
        SignUp.id: (context) => SignUp(),
        SignIn.id: (context) => SignIn(),
        MainPage.id: (context) => MainPage(),
          ForgotPasswordPage.id: (context) => ForgotPasswordPage(),
        },

      theme: ThemeData(brightness: Brightness.light,
        primarySwatch: Colors.red,

      ),

    );
  }
}

