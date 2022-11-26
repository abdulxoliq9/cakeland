import 'package:cakeland/auth/main_page.dart';
import 'package:cakeland/sign/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static final String id = 'signUp';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp()async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(), 
          password: _passwordController.text.trim());
      Navigator.pushReplacementNamed(context, MainPage.id);

    }
  }
  bool passwordConfirmed(){
    if(_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                      child: const Image(image: AssetImage('assets/images/cake_logo.png'),
                      )))),
              SizedBox(height: 20,),
                Text('Cake Land',style: GoogleFonts.
                   kolkerBrush(fontSize: 70,
                    color: Colors.red.shade800,
                     fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  controller: _passwordController,
                  //obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  controller: _confirmPasswordController,
                  //obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),SizedBox(height: 15,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red.shade700,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  onTap: (){
                    signUp();
                  },
                  child: Center(
                    child: Text('Sign Up',
                      style: GoogleFonts.ubuntu(
                          color: Colors.red.shade50,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('I am a member',style:
                  GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SignIn.id);
                    },
                    child: Text('Login now',style:
                    GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade700
                    ),),
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
