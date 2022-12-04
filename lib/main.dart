import 'package:cakeland/pages/cakePage/CookiePage/cookiePage.dart';
import 'package:cakeland/pages/cakePage/DonutPage/donutPage.dart';
import 'package:cakeland/pages/cakePage/FruitlyPage/fruitlyPage.dart';
import 'package:cakeland/pages/cakePage/PiePage/piePage.dart';
import 'package:cakeland/pages/cakePage/SweetPage/sweetPage.dart';
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
        HomePage.id: (context) => const HomePage(),
        BasketPage.id: (context) => const BasketPage(),
        SettingPage.id: (context) => const SettingPage(),
        SignUp.id: (context) => const SignUp(),
        SignIn.id: (context) => const SignIn(),
        MainPage.id: (context) => const MainPage(),
        ForgotPasswordPage.id: (context) => const ForgotPasswordPage(),
        CookieCakePage.id: (context) => const CookieCakePage(),
        DonutCakePage.id: (context) => const DonutCakePage(),
        FruitlyCakePage.id: (context) => const FruitlyCakePage(),
        PieCakePage.id: (context) => const PieCakePage(),
        SweetCakePage.id: (context) => const SweetCakePage(),
        },

      theme: ThemeData(brightness: Brightness.light,
        primarySwatch: Colors.red,

      ),

    );
  }
}

