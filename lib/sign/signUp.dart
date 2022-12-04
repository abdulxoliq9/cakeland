
import 'package:cakeland/auth/main_page.dart';
import 'package:cakeland/sign/signIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String id = 'signUp';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future signUp(context)async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(), 
          password: _passwordController.text.trim());
      Navigator.pushReplacementNamed(context, MainPage.id);

      addUserDetail(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
      );
    }
  }

  Future addUserDetail(String firstName,String lastName,String email)async{
    await FirebaseFirestore.instance.collection('users').add({
      'first name':firstName,
      'last name':lastName,
      'email':email,
    });
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const ClipOval(
                      child: Image(image: AssetImage('assets/images/cake_logo.png'),
                      )))),
              const SizedBox(height: 20,),
                Text('Cake Land',style: GoogleFonts.
                   kolkerBrush(fontSize: 70,
                    color: Colors.red.shade800,
                     fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  controller: _passwordController,
                  //obscureText: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  controller: _confirmPasswordController,
                  //obscureText: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),
              ),const SizedBox(height: 15,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red.shade700,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  onTap: (){
                    signUp(context);
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
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('I am a member',style:
                  GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),),
                  const SizedBox(width: 10,),
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
