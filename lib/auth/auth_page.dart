import 'package:cakeland/sign/signIn.dart';
import 'package:cakeland/sign/signUp.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void tonggleScreen(){
    setState(() {
      showLoginPage == !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
     return SignIn();
   }else{
     return SignUp();
   }
  }
}
